object DMgoAml: TDMgoAml
  OldCreateOrder = False
  Height = 273
  Width = 607
  object DS_Main: TDataSource
    DataSet = ODS_Main
    Left = 40
    Top = 72
  end
  object ODS_Main: TOracleDataSet
    SQL.Strings = (
      'select * from mmx_rep_car_credt'
      'where transmode_code=:v_transmcode'
      'and transactiondate = :v_dat and report_code=:v_report_code'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'order by  transactionnumber '
      ''
      ''
      ''
      '/*select * from mmx_rep'
      
        'where transmode_code=:v_transmcode and (DCUSTID=:v_dcustid or KC' +
        'USTID=:v_kCUSTID)'
      'and transactiondate = :v_dat'
      'order by  transactionnumber */')
    Optimize = False
    Variables.Data = {
      04000000030000001A0000003A0056005F005400520041004E0053004D004300
      4F00440045000500000000000000000000000C0000003A0056005F0044004100
      54000C00000000000000000000001C0000003A0056005F005200450050004F00
      520054005F0043004F0044004500050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001A000000040000004900440001000000000022000000540052004100
      4E00530041004300540049004F004E004E0055004D0042004500520001000000
      0000160000005200450050004F00520054005F0043004F004400450001000000
      00000E0000004400450042004900540049004400010000000000140000004400
      45004200490054004100430043004E004F000100000000002400000044004500
      420049005400430055005200520045004E004300590053004E0041004D004500
      0100000000001000000043005200450044004900540049004400010000000000
      160000004300520045004400490054004100430043004E004F00010000000000
      26000000430052004500440049005400430055005200520045004E0043005900
      53004E0041004D0045000100000000002000000044005F0046004F0052004500
      490047004E005F0041004D004F0055004E005400010000000000200000004300
      5F0046004F0052004500490047004E005F0041004D004F0055004E0054000100
      000000001800000041004D004F0055004E0054005F004C004F00430041004C00
      0100000000002E00000044005F0046004F0052004500490047004E005F004500
      58004300480041004E00470045005F0052004100540045000100000000001800
      000044004500420049005400420041004C0041004E0043004500010000000000
      2E00000043005F0046004F0052004500490047004E005F004500580043004800
      41004E00470045005F0052004100540045000100000000001A00000043005200
      4500440049005400420041004C0041004E00430045000100000000002E000000
      5400520041004E00530041004300540049004F004E005F004400450053004300
      520049005000540049004F004E000100000000000C0000004100430054004900
      4F004E000100000000002000000044004100540045005F005400520041004E00
      530041004300540049004F004E000100000000001C0000005400520041004E00
      53004D004F00440045005F0043004F0044004500010000000000180000004400
      45004200540043005500530054004E0041004D00450001000000000018000000
      430052004500440043005500530054004E0041004D0045000100000000000E00
      000044004300550053005400490044000100000000000E0000004B0043005500
      5300540049004400010000000000120000004B0041005300530041004E004F00
      560055000100000000001E0000005400520041004E0053004100430054004900
      4F004E004400410054004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 16
    object ODS_MainID: TFloatField
      FieldName = 'ID'
    end
    object ODS_MainREPORT_CODE: TWideStringField
      FieldName = 'REPORT_CODE'
      Size = 3
    end
    object ODS_MainDEBITID: TFloatField
      FieldName = 'DEBITID'
    end
    object ODS_MainDEBITACCNO: TWideStringField
      FieldName = 'DEBITACCNO'
      Size = 448
    end
    object ODS_MainDEBITCURRENCYSNAME: TWideStringField
      FieldName = 'DEBITCURRENCYSNAME'
      Size = 160
    end
    object ODS_MainCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object ODS_MainCREDITACCNO: TWideStringField
      FieldName = 'CREDITACCNO'
      Size = 448
    end
    object ODS_MainCREDITCURRENCYSNAME: TWideStringField
      FieldName = 'CREDITCURRENCYSNAME'
      Size = 160
    end
    object ODS_MainD_FOREIGN_AMOUNT: TFloatField
      FieldName = 'D_FOREIGN_AMOUNT'
    end
    object ODS_MainC_FOREIGN_AMOUNT: TFloatField
      FieldName = 'C_FOREIGN_AMOUNT'
    end
    object ODS_MainAMOUNT_LOCAL: TFloatField
      FieldName = 'AMOUNT_LOCAL'
    end
    object ODS_MainD_FOREIGN_EXCHANGE_RATE: TFloatField
      FieldName = 'D_FOREIGN_EXCHANGE_RATE'
    end
    object ODS_MainDEBITBALANCE: TFloatField
      FieldName = 'DEBITBALANCE'
    end
    object ODS_MainC_FOREIGN_EXCHANGE_RATE: TFloatField
      FieldName = 'C_FOREIGN_EXCHANGE_RATE'
    end
    object ODS_MainCREDITBALANCE: TFloatField
      FieldName = 'CREDITBALANCE'
    end
    object ODS_MainTRANSACTION_DESCRIPTION: TWideStringField
      FieldName = 'TRANSACTION_DESCRIPTION'
      Size = 1020
    end
    object ODS_MainACTION: TWideStringField
      FieldName = 'ACTION'
      Size = 14
    end
    object ODS_MainDATE_TRANSACTION: TWideStringField
      FieldName = 'DATE_TRANSACTION'
      Size = 19
    end
    object ODS_MainTRANSMODE_CODE: TIntegerField
      FieldName = 'TRANSMODE_CODE'
    end
    object ODS_MainDEBTCUSTNAME: TWideStringField
      FieldName = 'DEBTCUSTNAME'
      Size = 360
    end
    object ODS_MainCREDCUSTNAME: TWideStringField
      FieldName = 'CREDCUSTNAME'
      Size = 360
    end
    object ODS_MainDCUSTID: TFloatField
      FieldName = 'DCUSTID'
    end
    object ODS_MainKCUSTID: TFloatField
      FieldName = 'KCUSTID'
    end
    object ODS_MainKASSANOVU: TWideStringField
      FieldName = 'KASSANOVU'
      Size = 7
    end
    object ODS_MainTRANSACTIONDATE: TDateTimeField
      FieldName = 'TRANSACTIONDATE'
    end
    object ODS_MainTRANSACTIONNUMBER: TFloatField
      FieldName = 'TRANSACTIONNUMBER'
    end
  end
  object ODS_FilesPath: TOracleDataSet
    SQL.Strings = (
      'select description from settings where name='#39'GoAmlFilesPath'#39)
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000001000000160000004400450053004300520049005000540049004F00
      4E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 528
    Top = 120
    object ODS_FilesPathDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 1024
    end
  end
  object ods_jeson_credit: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '    JSON_OBJECT('
      '        '#39'reports'#39' VALUE JSON_ARRAY('
      '            JSON_OBJECT('
      '                '#39'header'#39' VALUE JSON_OBJECT('
      '                    '#39'sendDate'#39' VALUE '#39'01-JAN-2024'#39','
      '                    '#39'reportType'#39' VALUE 1,'
      '                    '#39'reportReason'#39' VALUE 1'
      '                ),'
      '                '#39'transactions'#39' VALUE JSON_ARRAY('
      '                    JSON_OBJECT('
      '                        '#39'Transaction'#39' VALUE JSON_OBJECT('
      '                            '#39'trn_status'#39' VALUE action,'
      
        '                            '#39'trn_actual_date'#39' VALUE date_transac' +
        'tion,'
      
        '                            '#39'trn_bank_date'#39' VALUE date_transacti' +
        'on,'
      '                            '#39'trn_external_number'#39' VALUE ID,'
      '                            '#39'trn_internal_number'#39' VALUE ID,'
      '                            '#39'trn_type'#39' VALUE report_code,'
      '                            '#39'Purpose'#39' VALUE JSON_OBJECT('
      
        '                                '#39'trn_description'#39' VALUE report_c' +
        'ode,'
      
        '                                '#39'trn_detailed_id'#39' VALUE report_c' +
        'ode,'
      
        '                                '#39'trn_fund_source'#39' VALUE report_c' +
        'ode'
      '                            ),'
      '                            '#39'trn_chanel'#39' VALUE report_code,'
      
        '                            '#39'trn_payment_system'#39' VALUE report_co' +
        'de'
      '                        ),'
      '                        '#39'Representative'#39' VALUE JSON_OBJECT('
      '                            '#39'repr_status'#39' VALUE report_code'
      '                        ),'
      '                        '#39'Sender'#39' VALUE JSON_OBJECT('
      
        '                            '#39'sender_country_name'#39' VALUE report_c' +
        'ode,'
      '                            '#39'Entity'#39' VALUE JSON_OBJECT('
      
        '                                '#39'sender_entity_name'#39' VALUE repor' +
        't_code,'
      
        '                                '#39'sender_entity_reg_country'#39' VALU' +
        'E report_code,'
      
        '                                '#39'sender_entity_tax_number'#39' VALUE' +
        ' report_code'
      '                            ),'
      '                            '#39'Funds'#39' VALUE JSON_OBJECT('
      
        '                                '#39'sender_curr_type'#39' VALUE report_' +
        'code,'
      
        '                                '#39'sender_curr_amount'#39' VALUE repor' +
        't_code,'
      
        '                                '#39'sender_amount_local'#39' VALUE repo' +
        'rt_code'
      '                            ),'
      '                            '#39'Account'#39' VALUE JSON_OBJECT('
      
        '                                '#39'sender_account_number'#39' VALUE re' +
        'port_code,'
      
        '                                '#39'sender_account_dubl_number'#39' VAL' +
        'UE report_code,'
      
        '                                '#39'sender_account_currency'#39' VALUE ' +
        'report_code,'
      
        '                                '#39'sender_account_pan_id_number'#39' V' +
        'ALUE report_code,'
      
        '                                '#39'sender_account_3d_secure'#39' VALUE' +
        ' report_code,'
      
        '                                '#39'sender_account_fin_inst_country' +
        #39' VALUE report_code,'
      
        '                                '#39'sender_account_fin_inst_bic_id'#39 +
        ' VALUE report_code,'
      
        '                                '#39'sender_account_fin_inst_name'#39' V' +
        'ALUE report_code,'
      
        '                                '#39'sender_account_fin_inst_branch'#39 +
        ' VALUE report_code,'
      
        '                                '#39'sender_account_fin_inst_bic'#39' VA' +
        'LUE report_code,'
      
        '                                '#39'sender_account_fin_inst_tax_id'#39 +
        ' VALUE report_code'
      '                            )'
      '                        ),'
      '                        '#39'Receiver'#39' VALUE JSON_OBJECT('
      
        '                            '#39'receiver_country_name'#39' VALUE report' +
        '_code,'
      '                            '#39'Person'#39' VALUE JSON_OBJECT('
      
        '                                '#39'receiver_first_name'#39' VALUE repo' +
        'rt_code,'
      
        '                                '#39'receiver_last_name'#39' VALUE repor' +
        't_code,'
      
        '                                '#39'receiver_middle_name'#39' VALUE rep' +
        'ort_code,'
      
        '                                '#39'receiver_citizenship'#39' VALUE rep' +
        'ort_code,'
      
        '                                '#39'receiver_id_serial'#39' VALUE repor' +
        't_code,'
      
        '                                '#39'receiver_id_number'#39' VALUE repor' +
        't_code,'
      
        '                                '#39'receiver_pin_code'#39' VALUE report' +
        '_code,'
      
        '                                '#39'receiver_id_issue_date'#39' VALUE r' +
        'eport_code,'
      
        '                                '#39'receiver_id_expiry_date'#39' VALUE ' +
        'report_code,'
      
        '                                '#39'receiver_phone_number'#39' VALUE re' +
        'port_code,'
      
        '                                '#39'receiver_tax_id'#39' VALUE report_c' +
        'ode,'
      
        '                                '#39'receiver_birth_date'#39' VALUE repo' +
        'rt_code,'
      
        '                                '#39'receiver_id_type'#39' VALUE report_' +
        'code'
      '                            ),'
      '                            '#39'Funds'#39' VALUE JSON_OBJECT('
      
        '                                '#39'receiver_curr_type'#39' VALUE repor' +
        't_code,'
      
        '                                '#39'receiver_curr_amount'#39' VALUE rep' +
        'ort_code,'
      
        '                                '#39'receiver_amount_local'#39' VALUE re' +
        'port_code'
      '                            ),'
      '                            '#39'Account'#39' VALUE JSON_OBJECT('
      
        '                                '#39'receiver_account_number'#39' VALUE ' +
        'report_code,'
      
        '                                '#39'receiver_account_dubl_number'#39' V' +
        'ALUE report_code,'
      
        '                                '#39'receiver_account_currency'#39' VALU' +
        'E report_code,'
      
        '                                '#39'receiver_account_pan_id_number'#39 +
        ' VALUE report_code,'
      
        '                                '#39'receiver_account_3dsecure'#39' VALU' +
        'E report_code,'
      
        '                                '#39'receiver_account_fin_inst_name'#39 +
        ' VALUE report_code,'
      
        '                                '#39'receiver_account_fin_inst_count' +
        'ry'#39' VALUE report_code,'
      
        '                                '#39'receiver_account_fin_inst_tax_i' +
        'd'#39' VALUE report_code,'
      
        '                                '#39'receiver_account_fin_inst_bic_i' +
        'd'#39' VALUE report_code,'
      
        '                                '#39'receiver_account_fin_inst_branc' +
        'h'#39' VALUE report_code,'
      
        '                                '#39'receiver_account_fin_inst_bic'#39' ' +
        'VALUE report_code'
      '                            )'
      '                        ),'
      '                        '#39'Correspondence'#39' VALUE JSON_OBJECT('
      '                            '#39'debet'#39' VALUE debitaccno,'
      '                            '#39'Credit'#39' VALUE creditaccno '
      '                        )'
      '                    )'
      '                )'
      '            )'
      '        )'
      '    ) AS json_report'
      'FROM mmx_rep_car_credt where id=:v_id')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0500000001000000160000004A0053004F004E005F005200450050004F005200
      5400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 152
    object ods_jeson_creditJSON_REPORT: TWideStringField
      FieldName = 'JSON_REPORT'
      Size = 4000
    end
  end
  object ODS_Maindebt: TOracleDataSet
    SQL.Strings = (
      'select * from mmx_rep_car_credt'
      'where transmode_code=:v_transmcode'
      'and transactiondate = :v_dat and report_code=:v_report_code'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'order by  transactionnumber ')
    Optimize = False
    Variables.Data = {
      04000000030000001A0000003A0056005F005400520041004E0053004D004300
      4F00440045000500000000000000000000000C0000003A0056005F0044004100
      54000C00000000000000000000001C0000003A0056005F005200450050004F00
      520054005F0043004F0044004500050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001A000000040000004900440001000000000022000000540052004100
      4E00530041004300540049004F004E004E0055004D0042004500520001000000
      0000160000005200450050004F00520054005F0043004F004400450001000000
      00000E0000004400450042004900540049004400010000000000140000004400
      45004200490054004100430043004E004F000100000000002400000044004500
      420049005400430055005200520045004E004300590053004E0041004D004500
      0100000000001000000043005200450044004900540049004400010000000000
      160000004300520045004400490054004100430043004E004F00010000000000
      26000000430052004500440049005400430055005200520045004E0043005900
      53004E0041004D0045000100000000002000000044005F0046004F0052004500
      490047004E005F0041004D004F0055004E005400010000000000200000004300
      5F0046004F0052004500490047004E005F0041004D004F0055004E0054000100
      000000001800000041004D004F0055004E0054005F004C004F00430041004C00
      0100000000002E00000044005F0046004F0052004500490047004E005F004500
      58004300480041004E00470045005F0052004100540045000100000000001800
      000044004500420049005400420041004C0041004E0043004500010000000000
      2E00000043005F0046004F0052004500490047004E005F004500580043004800
      41004E00470045005F0052004100540045000100000000001A00000043005200
      4500440049005400420041004C0041004E00430045000100000000002E000000
      5400520041004E00530041004300540049004F004E005F004400450053004300
      520049005000540049004F004E000100000000000C0000004100430054004900
      4F004E000100000000002000000044004100540045005F005400520041004E00
      530041004300540049004F004E000100000000001C0000005400520041004E00
      53004D004F00440045005F0043004F0044004500010000000000180000004400
      45004200540043005500530054004E0041004D00450001000000000018000000
      430052004500440043005500530054004E0041004D0045000100000000000E00
      000044004300550053005400490044000100000000000E0000004B0043005500
      53005400490044000100000000001E0000005400520041004E00530041004300
      540049004F004E0044004100540045000100000000002600000049004E005400
      450052004E0041004C005F005200450046005F004E0055004D00420045005200
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 120
    Top = 16
    object ODS_MaindebtID: TFloatField
      FieldName = 'ID'
    end
    object ODS_MaindebtREPORT_CODE: TWideStringField
      FieldName = 'REPORT_CODE'
      Size = 3
    end
    object ODS_MaindebtDEBITID: TFloatField
      FieldName = 'DEBITID'
    end
    object ODS_MaindebtDEBITACCNO: TWideStringField
      FieldName = 'DEBITACCNO'
      Size = 448
    end
    object ODS_MaindebtDEBITCURRENCYSNAME: TWideStringField
      FieldName = 'DEBITCURRENCYSNAME'
      Size = 160
    end
    object ODS_MaindebtCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object ODS_MaindebtCREDITACCNO: TWideStringField
      FieldName = 'CREDITACCNO'
      Size = 448
    end
    object ODS_MaindebtCREDITCURRENCYSNAME: TWideStringField
      FieldName = 'CREDITCURRENCYSNAME'
      Size = 160
    end
    object ODS_MaindebtD_FOREIGN_AMOUNT: TFloatField
      FieldName = 'D_FOREIGN_AMOUNT'
    end
    object ODS_MaindebtC_FOREIGN_AMOUNT: TFloatField
      FieldName = 'C_FOREIGN_AMOUNT'
    end
    object ODS_MaindebtAMOUNT_LOCAL: TFloatField
      FieldName = 'AMOUNT_LOCAL'
    end
    object ODS_MaindebtD_FOREIGN_EXCHANGE_RATE: TFloatField
      FieldName = 'D_FOREIGN_EXCHANGE_RATE'
    end
    object ODS_MaindebtDEBITBALANCE: TFloatField
      FieldName = 'DEBITBALANCE'
    end
    object ODS_MaindebtC_FOREIGN_EXCHANGE_RATE: TFloatField
      FieldName = 'C_FOREIGN_EXCHANGE_RATE'
    end
    object ODS_MaindebtCREDITBALANCE: TFloatField
      FieldName = 'CREDITBALANCE'
    end
    object ODS_MaindebtTRANSACTION_DESCRIPTION: TWideStringField
      FieldName = 'TRANSACTION_DESCRIPTION'
      Size = 1020
    end
    object ODS_MaindebtACTION: TWideStringField
      FieldName = 'ACTION'
      Size = 14
    end
    object ODS_MaindebtDATE_TRANSACTION: TWideStringField
      FieldName = 'DATE_TRANSACTION'
      Size = 19
    end
    object ODS_MaindebtTRANSMODE_CODE: TIntegerField
      FieldName = 'TRANSMODE_CODE'
    end
    object ODS_MaindebtDEBTCUSTNAME: TWideStringField
      FieldName = 'DEBTCUSTNAME'
      Size = 360
    end
    object ODS_MaindebtCREDCUSTNAME: TWideStringField
      FieldName = 'CREDCUSTNAME'
      Size = 360
    end
    object ODS_MaindebtDCUSTID: TFloatField
      FieldName = 'DCUSTID'
    end
    object ODS_MaindebtKCUSTID: TFloatField
      FieldName = 'KCUSTID'
    end
    object ODS_MaindebtTRANSACTIONDATE: TDateTimeField
      FieldName = 'TRANSACTIONDATE'
    end
    object ODS_MaindebtTRANSACTIONNUMBER: TFloatField
      FieldName = 'TRANSACTIONNUMBER'
    end
  end
  object DS_Maindbt: TDataSource
    DataSet = ODS_Maindebt
    Left = 120
    Top = 72
  end
  object ODS_Rep: TOracleDataSet
    SQL.Strings = (
      
        'select transmode_code, report_code,custid,b.name,sum(lammount) l' +
        'ammount,dk  from ('
      
        'select ti.transmode_code,ti.report_code,l.kcustid as custid,sum(' +
        'l.lamount) lammount, 1 as dk  from mmx_transactions l,mmx_transi' +
        'nfo ti '
      ' where l.id=ti.transid and  '
      
        ' (l.debitbalance in (select bal_cn from bal_spr1 where goaml=1) ' +
        'and  '
      
        ' l.debitbalance in ('#39'1001'#39','#39'1011'#39','#39'1003'#39','#39'2801'#39','#39'2811'#39'/*turan b,' +
        #39#39'2509'#39#39','#39#39'2519'#39#39','#39#39'2801'#39#39','#39#39'2811'#39#39','#39#39'4801'#39#39','#39#39'4811'#39#39','#39#39'4509'#39#39','#39 +
        #39'4519'#39#39'*/))'
      
        ' and l.transactiondate=:V_DAT and l.lamount>=20000 and ti.report' +
        '_code  in('#39'CTR'#39','#39'TPR1'#39','#39'TPR2'#39','#39'TPR3'#39')'
      ' group by ti.transmode_code,ti.report_code,l.kcustid '
      ''
      ' union all '
      
        ' select ti.transmode_code,ti.report_code,l.dcustid as custid  , ' +
        'sum(l.lamount) lammount,2 as dk from mmx_transactions l,mmx_tran' +
        'sinfo ti '
      ' where l.id=ti.transid and '
      
        '(l.creditbalance in (select bal_cn from bal_spr1 where goaml=1) ' +
        'and  '
      
        ' l.creditbalance in ('#39'1001'#39','#39'1011'#39','#39'1003'#39','#39'2801'#39','#39'2811'#39'/*,'#39#39'2509' +
        #39#39','#39#39'2519'#39#39','#39#39'2801'#39#39','#39#39'2811'#39#39','#39#39'4801'#39#39','#39#39'4811'#39#39','#39#39'4509'#39#39','#39#39'4519'#39 +
        #39'*/)) '
      
        ' and l.transactiondate=:V_DAT and l.lamount>=20000 and ti.report' +
        '_code  in('#39'CTR'#39','#39'TPR1'#39','#39'TPR2'#39','#39'TPR3'#39')'
      
        ' group by ti.transmode_code,ti.report_code,l.dcustid) a, custome' +
        'rs b where  a.custid=b.id /*and b.compani  not in(2,3,5,6,7)*/ '
      ''
      ' group by transmode_code, report_code,custid ,name,dk'
      ' order by transmode_code')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A0056005F004400410054000C00000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      05000000060000001C0000005400520041004E0053004D004F00440045005F00
      43004F00440045000100000000000C0000004300550053005400490044000100
      00000000100000004C0041004D004D004F0055004E0054000100000000000800
      00004E0041004D004500010000000000160000005200450050004F0052005400
      5F0043004F00440045000100000000000400000044004B00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 368
    Top = 16
    object ODS_RepTRANSMODE_CODE: TIntegerField
      FieldName = 'TRANSMODE_CODE'
    end
    object ODS_RepREPORT_CODE: TWideStringField
      FieldName = 'REPORT_CODE'
      Size = 100
    end
    object ODS_RepCUSTID: TFloatField
      FieldName = 'CUSTID'
    end
    object ODS_RepNAME: TWideStringField
      FieldName = 'NAME'
      Size = 250
    end
    object ODS_RepLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
    end
    object ODS_RepDK: TFloatField
      FieldName = 'DK'
    end
  end
  object DS_Rep: TDataSource
    DataSet = ODS_Rep
    Left = 368
    Top = 72
  end
  object odsa_grid: TOracleDataSet
    SQL.Strings = (
      'select '#39#39' from dual')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 272
    Top = 16
  end
  object dsrc_grid: TDataSource
    DataSet = odsa_grid
    Left = 272
    Top = 88
  end
end
