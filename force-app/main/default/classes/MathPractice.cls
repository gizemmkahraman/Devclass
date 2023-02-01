public class MathPractice {
        public Decimal practiseOne(Decimal a, Decimal b){
            decimal cevre = 2*(a+b);
            return cevre;
            }
        
        public Decimal practiseTwo(Decimal boy, Decimal kilo){
                decimal VKI = Kilo / (boy * boy);
                return VKI;
                }

        public decimal practiseThree(decimal a, decimal b){
            Decimal ort =(a + b)/2;
            return ort;
            }

        public decimal practiseFour(decimal tutar){
            decimal bonus = 0;
            
            if (0 < tutar  && tutar<= 49){
                system.debug(' Bonus kazanamadınız.');
            }else if (50 <= tutar && tutar <= 199){
                system.debug(tutar + 'tutarındaki alışveriş karşılığı 10 $ tutarında bonus kazandınız.');               
            }else if(200 <= tutar && tutar <= 499){
                system.debug(tutar + 'tutarındaki alışveriş karşılığı 30 $ tutarında bonus kazandınız.');  
            }else if (500 <= tutar) {
                system.debug(tutar + 'tutarındaki alışveriş karşılığı 50 $ tutarında bonus kazandınız.');
            }else {
                system.debug('Hatalı bir değer girdiniz.');
            }
        
             return bonus;
        }

        public decimal practiseFive(string urun, integer miktar){
            decimal ucret = 0;
            switch on urun {
                when'Ekmek' {
                    ucret = miktar *1;
                }
                when 'Simit' {
                    ucret = miktar *2;
                }
                when 'Kek'{
                    ucret = miktar *3;
                }
            }
                return ucret;

        }
        
}

