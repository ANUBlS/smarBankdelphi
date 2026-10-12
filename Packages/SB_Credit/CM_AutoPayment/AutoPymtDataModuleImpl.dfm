object AutoPymtDataMod: TAutoPymtDataMod
  OldCreateOrder = False
  Height = 480
  Width = 696
  object AutoPaymentableLoans: TOracleDataSet
    SQL.Strings = (
      
        '/*select * from cm_active_credits p,cm_accounts a,provdoc pr whe' +
        're  p.id=a.creditid and a.booroweraccid=pr.kredit and pr.vid_op ' +
        'in(55,60)'
      'and cm_common.accountrest_get(a.booroweraccid)>0'
      'and AUTOPAYMENT = 1--ON'
      'and  dateofgrant+2<sbop.get_date'
      '*/'
      '/*SELECT *'
      '  FROM cm_active_credits p, cm_accounts a'
      ' WHERE     p.id = a.creditid'
      '       AND p.dateofgrant + 10 < sbop.get_date'
      '       AND cm_utils.get_gecgun (p.id, sbop.get_date) < 21'
      '       AND cm_common.accountrest_get (a.booroweraccid) > 0'
      
        '     AND p.boorowerid not in(select boorowerid from cm_active_cr' +
        'edits group by boorowerid having count(*)>1)*/'
      ''
      '/*For PSG*/'
      
        '  select p.id from cm_active_credits p,cm_accounts a ,cm_curr_st' +
        'ate h'
      '  where  AUTOPAYMENT=1 and p.id=a.creditid and p.id=h.creditid'
      '  and cm_common.accountrest_get(a.booroweraccid)>0'
      '  AND p.dateofgrant + 5 < sbop.get_date')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 64
  end
  object CM_PAYMENT: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_PAYMENT'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 168
    Top = 136
  end
end
