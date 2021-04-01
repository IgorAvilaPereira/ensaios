package negocio;

/**
 *
 * @author iapereira
 */
public final class Date {

    public final int year;
    public final int month;
    public final int day;

    public Date() {
        this.year = 1900;
        this.month = 1;
        this.day = 1;
    }

    public Date(int year, int month, int day) {
        int aux;
        /*
        System.out.println("========================");
        System.out.println("oi construtor");
        System.out.println("Ano:" + ano);
        System.out.println("Mes:" + mes);
        System.out.println("Dia:" + dia);
        System.out.println("========================");
         */
        if (year < 1900 && day >= 1900) {
            aux = year;
            year = day;
            day = aux;
        }
        if (year < 1900) {
            throw new IllegalArgumentException("ano invalido...");
        }
        if (month < 1 || month > 13) {
            throw new IllegalArgumentException("mes invalido...");
        }
        if (day < 1 || day > 31) {
            throw new IllegalArgumentException("dia invalido...");
        }
        if (day == 31 && (month == 4 || month == 6 || month == 9 || month == 11)) {
            throw new IllegalArgumentException("dia invalido...ano:" + year + "mes:" + month + "dia:" + day);
        }
        if (day == 29 && month == 2 && this.isLeapYear(year) == false) {
            throw new IllegalArgumentException("dia invalido....Ano nao eh bissexto...");
        }
        this.year = year;
        this.month = month;
        this.day = day;
    }

    @Override
    public String toString() {
        String string = "";
        if (day > 0 && day < 10) {
            string += "0" + day + "/";
        } else {
            string += day + "/";
        }
        if (month > 0 && month < 10) {
            string += "0" + month + "/";
        } else {
            string += month + "/";
        }
        return string += year;
    }

    @Override
    public boolean equals(Object o) {        
        if (o != null){
            if (o instanceof Date) {
                Date x = (Date) o;
                return this.year == x.year && this.month == x.month && this.day == x.day;
            }
            return false;
        }
        return false;
    }

    
    @Override
    public int hashCode() {
        int hash = 3;
        hash = 83 * hash + this.year;
        hash = 83 * hash + this.month;
        hash = 83 * hash + this.day;
        return hash;
    }   
    

    public Date tomorrow() {
        int newday, newmonth, newyear;
        if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10) {
            if (day <= 30) {
                newday = day + 1;
                newmonth = month;
                newyear = year;
                return new Date(newyear, newmonth, newday);
            } else {
                newday = 1;
                newmonth = month + 1;
                newyear = year;
                return new Date(newyear, newmonth, newday);
            }
        } else if (month == 4 || month == 6 || month == 9 || month == 11) {
            if (day < 30) {
                newday = day + 1;
                newmonth = month;
                newyear = year;
                return new Date(newyear, newmonth, newday);
            } else {
                newday = 1;
                newmonth = month + 1;
                newyear = year;
                return new Date(newyear, newmonth, newday);
            }
        }
        if (month == 2) {
            if (this.isLeapYear()) {
                if (day == 29) {
                    newday = 1;
                    newmonth = 3;
                    newyear = this.year;
                    return new Date(newyear, newmonth, newday);
                } else {
                    newday = this.day + 1;
                    newmonth = this.month;
                    newyear = this.year;
                    return new Date(newyear, newmonth, newday);
                }
            } else if (day == 28) {
                newday = 1;
                newmonth = 3;
                newyear = this.year;
                return new Date(newyear, newmonth, newday);
            } else {
                newday = this.day + 1;
                newmonth = this.month;
                newyear = this.year;
                return new Date(newyear, newmonth, newday);
            }
        }
        if (month == 12) {
            if (day == 31) {
                newday = 1;
                newmonth = 1;
                newyear = this.year + 1;
                return new Date(newyear, newmonth, newday);
            } else {
                newday = day + 1;
                newmonth = 12;
                newyear = this.year;
                return new Date(newyear, newmonth, newday);
            }
        }
        return new Date();
    }

    public boolean before(Date x) {
        if (this.year < x.year) {
            return true;
        } else if (this.year > x.year) {
            return false;
        } else if (this.month < x.month) {
            return true;
        } else if (this.month > x.month) {
            return false;
        } else {
            return this.day < x.day;
        }
    }

    public boolean after(Date x) {
        if (this.equals(x)) {
            return false;
        }
        return !this.before(x);
    }

    public boolean isLeapYear() {
        if (this.year % 4 == 0 && this.year % 100 != 0) {
            return true;
        } else if (this.year % 400 == 0) {
            return true;
        }
        return false;
    }

    private boolean isLeapYear(int ano) {
        if (ano % 4 == 0 && ano % 100 != 0) {
            return true;
        } else if (ano % 400 == 0) {
            return true;
        }
        return false;
    }

    public Date plusDays(int days) {
        if (days < 0) throw new IllegalArgumentException("invalid days...");
        
        Date object = new Date(this.year, this.month, this.day);
        
        for (int i = 0; i < days; i++) {
            /*
            System.out.println("========================");
            System.out.println("Ano:" + dataIgor.ano);
            System.out.println("Mes:" + dataIgor.mes);
            System.out.println("Dia:" + dataIgor.dia);
            System.out.println("========================");
             */
            object = object.tomorrow();
        }
        return object;
    }

    public Date yesterday() {
        int newday, newmonth, newyear;
        if (this.day == 1 && this.month == 1) {
            newday = 31;
            newmonth = 12;
            newyear = this.year - 1;
            return new Date(newyear, newmonth, newday);
        }
        if ((this.month == 5 || this.month == 7 || this.month == 10 || this.month == 12) && this.day == 1) {
            newday = 30;
            newmonth = this.month - 1;
            newyear = this.year;
            return new Date(newyear, newmonth, newday);
        } else if ((this.month == 2 || this.month == 4 || this.month == 6 || this.month == 8 || this.month == 9 || this.month == 11) && this.day == 1) {
            newday = 31;
            newmonth = this.month - 1;
            newyear = this.year;
            return new Date(newyear, newmonth, newday);
        }
        if (this.day == 1 && this.month == 3 && this.isLeapYear()) {
            newday = 29;
            newmonth = this.month - 1;
            newyear = this.year;
            return new Date(newyear, newmonth, newday);
        }
        if (this.day == 1 && this.month == 3 && this.isLeapYear() == false) {
            newday = 28;
            newmonth = this.month - 1;
            newyear = this.year;
            return new Date(newyear, newmonth, newday);
        }
        newday = this.day - 1;
        newmonth = this.month;
        newyear = this.year;
        return new Date(newyear, newmonth, newday);
    }

    public Date minusDays(int days) {
        if (days < 0) throw new IllegalArgumentException("invalid days...");

        Date object = new Date(this.year, this.month, this.day);
        for (int i = 0; i < days; i++) {
            object = object.yesterday();
            /*          
            System.out.println("========================");
            System.out.println("i:"+i);
            System.out.println("Ano:" + dataIgor.ano);
            System.out.println("Mes:" + dataIgor.mes);
            System.out.println("Dia:" + dataIgor.dia);
            System.out.println("========================"); 
             */
        }
        return object;
    }
}
