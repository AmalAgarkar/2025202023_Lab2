DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE existing_id INT;

    -- Check if subscriber already exists
    SELECT SubscriberID INTO existing_id
    FROM Subscribers
    WHERE SubscriberName = subName
    LIMIT 1;

    -- If not exists, insert
    IF existing_id IS NULL THEN
        INSERT INTO Subscribers (SubscriberName, SubscriptionDate)
        VALUES (subName, CURDATE());
    END IF;
END$$

DELIMITER ;
