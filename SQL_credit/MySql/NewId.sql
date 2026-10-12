SELECT  newid
  FROM sbcm_categories
  where newid is not null
  group by newid
