
CREATE VIEW Finansposter AS
SELECT 
    CAST([G_L Account No_] AS VARCHAR)                                  AS 'Kontonummer',--STD
    [Posting Date]                                                      AS 'Bogføringsdato',--STD
    [Salesperson Code]                                                  AS 'Salgsperson',--STD
    '***regnskab***'                                                    AS 'Regnskab',--STD
    [Amount]                                                            AS 'Beløb',--STD
  	CAST([G_L Account No_] AS VARCHAR)                                  AS 'TREJDENØGLE',--STD

    CONCAT('***regnskab***', '_', 
    CAST([G_L Account No_] AS VARCHAR))                                 AS 'Key_Company_Account_No',
    CONCAT('***regnskab***','_', [Dimension Set ID])                AS 'Key_Company_Dimension Set ID', 
	CONCAT([Source Type],'_', [Source No_])							AS 'Key_Source_Type_Code'
FROM ***schema***.dbo.[***regnskab***$G_L Entry]
GO

CREATE VIEW Kunde AS
SELECT 
[Salesperson Code]                                                  AS 'Salgsperson',--STD,
    '1_' + [No_]                                                        AS 'Key_Source_Type_Code',--STD
    [No_]                                                               AS 'Kundenummer',--STD
    C.Name                                                              AS 'Kundenavn',--STD
    [Salesperson Code]                                                  AS 'Salgsperson',--STD
    C.[Country_Region Code]                                             AS 'Landekode',
    CR.[Name]                                                           AS 'Land',
    [Post Code]                                                         AS 'Postnummer',
    PC.City                                                             AS 'By',
    '***regnskab***'                                                    AS 'Regnskab'
FROM ***schema***.dbo.[***regnskab***$Customer] AS C
LEFT JOIN ***schema***.dbo.[***regnskab***$Country_Region] AS CR
    ON C.[Country_Region Code] = CR.Code
LEFT JOIN ***schema***.dbo.[***regnskab***$Post Code] AS PC
    ON C.[Post Code] = PC.Code
GO
