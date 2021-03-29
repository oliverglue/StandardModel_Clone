
CREATE VIEW Finansposter AS
SELECT 
    CAST([G_L Account No_] AS VARCHAR)                                  AS 'Kontonummer',--STD
    CAST([G_L Account No_] AS VARCHAR)                                  AS 'ANDENNØGLE',--STD
    [Posting Date]                                                      AS 'Bogføringsdato',--STD
    '***regnskab***'                                                    AS 'Regnskab',--STD
    [Amount]                                                            AS 'Beløb',--STD

    CONCAT('***regnskab***', '_', 
    CAST([G_L Account No_] AS VARCHAR))                                 AS 'Key_Company_Account_No',
    CONCAT('***regnskab***','_', [Dimension Set ID])                AS 'Key_Company_Dimension Set ID', 
	CONCAT([Source Type],'_', [Source No_])							AS 'Key_Source_Type_Code',
      CAST([G_L Account No_] AS VARCHAR))                                 AS 'Key_Company_Account_No',
    CONCAT('***regnskab***','_', [Dimension Set ID])                AS 'Key_Company_Dimension Set ID', 
    CONCAT([Source Type],'_', [Source No_])                         AS 'Key_Source_Type_Code',
      CAST([G_L Account No_] AS VARCHAR))                                 AS 'Key_Company_Account_No',
    CONCAT('***regnskab***','_', [Dimension Set ID])                AS 'Key_Company_Dimension Set ID', 
    CONCAT([Source Type],'_', [Source No_])                         AS 'Key_Source_Type_Code'
FROM ***schema***.dbo.[***regnskab***$G_L Entry]
GO

CREATE VIEW Kunde AS
SELECT 
    '1_' + [No_]                                                        AS 'Key_Source_Type_Code',--STD
    [No_]                                                               AS 'Kundenummer',--STD
    CAST([G_L Account No_] AS VARCHAR)                                  AS 'ANDENNØGLE',--STD
    C.Name                                                              AS 'Kundenavn',--STD
    [Salesperson Code]                                                  AS 'Salgsperson',--STD
    C.[Country_Region Code]                                             AS 'Landekode', --STD
    CR.[Name]                                                           AS 'Land',
    [Post Code]                                                         AS 'Postnummer',
    PC.City                                                             AS 'By',
    '***regnskab***'                                                    AS 'Regnskab',
        CR.[Name]                                                           AS 'Land',
            CR.[Name]                                                           AS 'Land',
FROM ***schema***.dbo.[***regnskab***$Customer] AS C
LEFT JOIN ***schema***.dbo.[***regnskab***$Country_Region] AS CR
    ON C.[Country_Region Code] = CR.Code
LEFT JOIN ***schema***.dbo.[***regnskab***$Post Code] AS PC
    ON C.[Post Code] = PC.Code
GO
