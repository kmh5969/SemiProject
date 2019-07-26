DROP SEQUENCE RECIPEBOARDSEQ;
DROP TABLE RECIPEBOARD;

CREATE SEQUENCE RECIPEBOARDSEQ;
CREATE TABLE RECIPEBOARD(

	RECIPEBOARD_NO 			NUMBER 			 PRIMARY KEY,
	ID 						VARCHAR2(500) 	 NOT NULL,
	RECIPEBOARD_TITLE 		VARCHAR2(2000)	 NOT NULL,
	RECIPEBOARD_CONTENT	 	VARCHAR2(4000)	 NOT NULL,
	RECIPEBOARD_REGDATE		VARCHAR2(500)	 NOT NULL,
	RECIPEBOARD_READCOUNT	NUMBER			 NOT NULL,
	RECIPEBOARD_LIKE		NUMBER			 NOT NULL,
	
	CONSTRAINT FK_RECIPEBOARD_ID FOREIGN KEY(ID) 
	REFERENCES MEMBER(ID)
);

SELECT * FROM RECIPEBOARD;