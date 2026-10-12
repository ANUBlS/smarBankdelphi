ALTER TABLE bankproperties
ADD CONSTRAINT fk_bankproperties_credit FOREIGN KEY (kredit)
REFERENCES account (id) ON DELETE SET NULL
/
ALTER TABLE bankproperties
ADD CONSTRAINT fk_bankproperties_debit FOREIGN KEY (debet)
REFERENCES account (id) ON DELETE SET NULL
/
ALTER TABLE bankproperties
ADD CONSTRAINT fk_bankproperties_f5501p FOREIGN KEY (f5501p)
REFERENCES account (id) ON DELETE SET NULL
/
ALTER TABLE bankproperties
ADD CONSTRAINT fk_bankproperties_f5501v FOREIGN KEY (f5501v)
REFERENCES account (id) ON DELETE SET NULL
/
ALTER TABLE bankproperties
ADD CONSTRAINT fk_bankproperties_scredit FOREIGN KEY (scredit)
REFERENCES account (id) ON DELETE SET NULL
/
ALTER TABLE bankproperties
ADD CONSTRAINT fk_bankproperties_sdebit FOREIGN KEY (sdebet)
REFERENCES account (id) ON DELETE SET NULL
/
ALTER TABLE bankproperties
ADD CONSTRAINT fk_bankproperties_valute FOREIGN KEY (valute)
REFERENCES avalute_t (valute) ON DELETE CASCADE
/
ALTER TABLE bankproperties
ADD CONSTRAINT fk_bankproperties_filial FOREIGN KEY (filialid)
REFERENCES filial_t (id) ON DELETE CASCADE
/

