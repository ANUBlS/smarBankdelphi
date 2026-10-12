INSERT INTO cm_references
(ID,PARENTID,INAME,DESCRIPTION,INTEGERVALUE,CHARVALUE,AVAILABLEVALUES)
VALUES
(1,0,'HeadLeftRight','Саь вя йа солун гошулмасы',NULL,NULL,NULL)
/
INSERT INTO cm_references
(ID,PARENTID,INAME,DESCRIPTION,INTEGERVALUE,CHARVALUE,AVAILABLEVALUES)
VALUES
(2,1,'UseLeft','Щесаблама Гайдасы',0,NULL,'Саь-Гошулуб,Сол-Гошулуб')
/
INSERT INTO cm_references
(ID,PARENTID,INAME,DESCRIPTION,INTEGERVALUE,CHARVALUE,AVAILABLEVALUES)
VALUES
(3,0,'HeadContractDefaults','Сусмайа эюря гиймятляр',NULL,NULL,NULL)
/
INSERT INTO cm_references
(ID,PARENTID,INAME,DESCRIPTION,INTEGERVALUE,CHARVALUE,AVAILABLEVALUES)
VALUES
(4,3,'BankYearDays','Банк илиндя эцнлярин сайы',360,NULL,NULL)
/
INSERT INTO cm_references
(ID,PARENTID,INAME,DESCRIPTION,INTEGERVALUE,CHARVALUE,AVAILABLEVALUES)
VALUES
(5,0,'HeadTrancheDefaults','Транш',NULL,NULL,NULL)
/
INSERT INTO cm_references
(ID,PARENTID,INAME,DESCRIPTION,INTEGERVALUE,CHARVALUE,AVAILABLEVALUES)
VALUES
(6,0,'HeadTrControl','"Ясас китабчая" эедян ямялиййатларын идаря олунмасы',NULL,NULL,NULL)
/
INSERT INTO cm_references
(ID,PARENTID,INAME,DESCRIPTION,INTEGERVALUE,CHARVALUE,AVAILABLEVALUES)
VALUES
(7,5,'ReduceObligationOnTranch','Транш заманы ющдялик азалсын(балансданкянар)',1,NULL,'Азалмасын,Азалсын')
/
INSERT INTO cm_references
(ID,PARENTID,INAME,DESCRIPTION,INTEGERVALUE,CHARVALUE,AVAILABLEVALUES)
VALUES
(8,6,'TrCtrlShowDelayedTransactions','"Ясас китабчая" эедян ямялиййатлар автоматик тястиг олунсун',1,NULL,'Олунмасын,Олунсун')
/
INSERT INTO cm_references
(ID,PARENTID,INAME,DESCRIPTION,INTEGERVALUE,CHARVALUE,AVAILABLEVALUES)
VALUES
(9,0,'HeadNewCreditProps','Йени мцгавилянин ачылмасынын сазланмасы',NULL,NULL,NULL)
/
INSERT INTO cm_references
(ID,PARENTID,INAME,DESCRIPTION,INTEGERVALUE,CHARVALUE,AVAILABLEVALUES)
VALUES
(10,3,'ProcessOutBalanceTransactions','Балансданкянар ямялиййатлар автоматик апарылсын',0,NULL,'Апарылмасын,Апарылсын')
/
