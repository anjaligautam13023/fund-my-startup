const express=require("express");
const app=express('http');
const path = require('path');
var database = require('./database');
const session = require('express-session');
var bodyParser = require('body-parser');
var flash = require('express-flash');
const multer = require('multer');
var fs = require('fs');
const fileUpload = require('express-fileupload');
const exphbs = require('express-handlebars');
app.use(flash());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(fileUpload());
app.set('views', path.join(__dirname, 'views'));
app.engine('handlebars',exphbs.engine());
app.set('view engine','handlebars');

app.use(session({
   secret : 'localhost',
   resave : false,
   saveUninitialized : true
 }));

app.use(express.static(__dirname +'/public'));
var handlebars = require('handlebars');
handlebars.registerHelper("setVar", function(varName, varValue, options) {
   options.data.root[varName] = varValue;
 });
handlebars.registerHelper('eq', (a, b) => a == b)

handlebars.registerHelper("getPitchRequests", function(data, options)
{
   newData = []
    for(var i = 0;i<data.length;i++){
       if(data[i].Staus == 1){
          newData.push(data[i]);
       }
    }
    return newData;
});

handlebars.registerHelper("getAcceptedPitch", function(data, options)
{
    newData = []
    for(var i = 0;i<data.length;i++){
       if(data[i].Staus == 2){
          newData.push(data[i]);
       }
    }
    return newData;
});

app.get("/", function(req,res){
   
    if(!req.session.user_name)
      res.render('index',{
      name:"",
    })
    
    if(req.session.user_name){
     
      query = `
      SELECT * FROM user
      WHERE user_type !=  "${req.session.type}"
      limit 6
      `;
      
      database.query(query, function(error, data){
        
         query2=`select *,count(investorid) as top from pitch inner join user on pitch.investorid=user.id group by investorid order by count(investorid) desc limit 5;`;
         database.query(query2, function(error, topinvestor){
       

         res.render('index',{
          user_type:req.session.type,
          topinvestor:topinvestor,
          name:req.session.user_name,
          id:req.session.user_id,
          db_data:data
          
         })
       }) 
      })
    }
 
})
app.get("/update", function(req,res){
   var id=req.query.Id;
   query = ` SELECT * FROM user
   WHERE id = "${id}" `;  
   database.query(query, function(error, userData){  
   res.render('update',{
        user_data:userData[0]
       })
  })
})

app.get("/logout", function(req,res){
   
   req.session.user_name ="";
   req.session.user_id="";
   req.session.type="";
   res.redirect('/');
  

})

app.get("/profile", function(req,res){
   var id=req.query.Id;
   query = ` SELECT * FROM user
   WHERE id = "${id}" `;

  database.query(query, function(error, userData){
      query2 = `SELECT * FROM products
      WHERE userid = "${req.session.user_id}" `;
      database.query(query2, function(error, proData){

       query3=`select * from pitch pt inner join products ps on pt.ProductId = ps.product_id
       where investorid="${id}"
      `;
      
       database.query(query3, function(error, pitchr){
       
           res.render('profile',{
            user_type:req.session.type,
           pitchrequest:pitchr,
          name:req.session.user_name,
           user_data:userData[0],
           id:req.session.user_id,
           proData:proData
           
           })
         })
      })
   })
})

app.post("/pitch", function(req,res){
    var UserId=req.session.user_id;
    var ProductId= req.body.product;
    var investorid=req.query.investorid;
    var url=req.body.url;
    var descrip=req.body.descrip;
    var demand=req.body.demand;
    var percent=req.body.percent;
    var Status=1;
 
    database.query(`INSERT INTO pitch(UserId,ProductId,Staus,investorid,percent,descrip,url,demand) values(?,?,?,?,?,?,?,?)`, [UserId,ProductId,Status,investorid,percent,descrip,url,demand], function(err, result){
      if (err) {
         req.flash('error', err)
      }
     var string = encodeURIComponent(investorid);
     res.redirect('/profile?Id='+string);
   })
})


 app.get("/about", function(req,res){
  
   query = `
   SELECT * FROM products
   WHERE userid =  "${req.session.user_id}"
   `;
   database.query(query, function(error, data){
 
      res.render('about',{
       
     
       pr_data:data
       
      })
    }) 
 
})

app.get("/about/object-form", function(req,res){
  

   res.render('object-form',{

     })
 
})
app.get("/delete_request", function(req,res){
  
   var id=req.query.pitchid_id;
  

   var q=`delete from pitch where PitchID="${id}"`; 
   database.query(q, function(err, result){
      if (err) {
         req.flash('error', err)
      }
   })
   var uid = req.query.visited_user;
   console.log(uid);
   var string = encodeURIComponent(uid);
   res.redirect('/profile?Id='+string)

   
 
})
app.get("/accept", function(req,res){
  
   var id=req.query.pitchid_id;
  

   var q=`update pitch set staus=2 where PitchID="${id}"`; 
   database.query(q, function(err, result){
      if (err) {
         req.flash('error', err)
      }
   })
   var uid = req.query.visited_user;
   console.log(uid);
   var string = encodeURIComponent(uid);
   res.redirect('/profile?Id='+string)

   
 
})
app.post("/submit-update",function(req,res){
   var photos = req.body.photo;
   var username = req.body.username;
   var email = req.body.email;
   var mobile = req.body.mobile;
   var place = req.body.place;
   var pass = req.body.pass;
   var type= req.body.type;
   var descrip= req.body.descrip;
   var tag= req.body.tag;

   var userid=req.session.user_id;
   console.log(req.files);
   const { photo } = req.files;

   // If no image submitted, exit
   if (!photo) return res.sendStatus(400);

   // Move the uploaded image to our upload folder
   photo.mv(__dirname + '\\public\\uploads\\' + photo.name);
   var img='/uploads/' + photo.name;
  
    var q=`UPDATE user SET user_name = ?,Email=?,mobile=?,profile=?,descrip=?,user_password=?,user_type=?,location=?,tagline=? WHERE id = ?`; 
   database.query(q,[username,email,mobile,img,descrip,pass,type,place,tag,userid], function(err, result){
      if (err) {
         req.flash('error', err)
      }
   })
   res.redirect('/');
 
})



app.post("/about/form-submit" ,function(req,res){
 
   var image=req.body.photo;
   var pro_name = req.body.pname;
   var ldate = req.body.ldate;
   var founders = req.body.founder;
   var des = req.body.description;
   var cv = req.body.cv;
   console.log(req.files);
   
   var user=req.session.user_id;
   const { photo } = req.files;

   // If no image submitted, exit
   if (!photo) return res.sendStatus(400);

   // Move the uploaded image to our upload folder
   photo.mv(__dirname + '\\public\\uploads\\' + photo.name);
   var img='/uploads/' + photo.name;
   database.query('INSERT INTO products(Product_name,description,launch_date,current_valuation,product_image,founders,userid) values(?,?,?,?,?,?,?)', [pro_name, des, ldate, cv, img,founders,user], function(err, result){
      if (err) {
         req.flash('error', err)
      }
   })
   res.redirect('/about');
 
})



app.get("/contact", function(req,res){

    res.sendFile(path.join(__dirname+'/login-signup.html'));
  
 }
 )
app.get("/about", function(req,res){
 res.sendFile(path.join(__dirname+'/about.html'));
 
})

app.post('/login', function(request, response, next){
   var user_email_address = request.body.email;

   var user_password = request.body.password;

  query = `
  SELECT * FROM user
  WHERE Email = "${user_email_address}" and user_password = "${user_password}"
  `;
  console.log(user_email_address);
  console.log(user_password);
  database.query(query, function(error, data){
   console.log(data);
  if(data){
           /* {query2 = `
             SELECT * FROM user inner join products 
             where id=userid
             `;
            database.query(query2, function(error, data1){
            request.session.id=data1[0].id;
            })
              */
              request.session.user_name = data[0].user_name;
              request.session.user_id = data[0].id;
              request.session.type=data[0].user_type;
              response.redirect('/');
               

            }
                    else
                    { 
                       response.send('Incorrect Password');
                    }
          
         });


});
app.post('/signup', function(request, response, next){
  

   
     const name= request.body.name;
     const email= request.body.email;
     const password= request.body.password;
     const type=request.body.type;
      
   
   database.query('INSERT INTO user(user_name,Email,user_password,user_type) values(?,?,?,?)', [name,email,password,type], function(err, result){
      if (err) {
         request.flash('error', err)
      }
   })
   response.redirect('/');

});

app.listen(3000,function(){
  console.log("server is running");
})


/*refernce 
  https://www.webslesson.info/2022/06/how-to-create-login-system-in-nodejs-express-with-mysql.html*/
  