DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createContact`
   (
	IN user_Name VARCHAR(50),
    IN Email VARCHAR(100),
    IN Message LONGTEXT,
    OUT out_id INT(10)
	 )
        BEGIN
        		INSERT INTO contact(Name, Email, Message) 
				  VALUES(user_Name, Email, Message);
        	SET out_id = LAST_INSERT_ID();
		  END 
//

DELIMITER ;