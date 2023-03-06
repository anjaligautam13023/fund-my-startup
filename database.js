const mysql = require('mysql');

const connection = mysql.createConnection({
	host : 'sql12.freemysqlhosting.net',
	database : 'sql12603324',
	user : 'sql12603324',
	password : 'GkV6jHBzn3'
});

connection.connect(function(error){
	if(error)
	{
		throw error;
	}
	else
	{  
		console.log('MySQL Database is connected Successfully');
	}
});


module.exports = connection;
