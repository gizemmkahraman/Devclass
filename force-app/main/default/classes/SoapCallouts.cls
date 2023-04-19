public with sharing class SoapCallouts {
    
    public static String[] getParksByCountry(String country){
        ParksServices.ParksImplPort parksService = new ParksServices.ParksImplPort();
        String[] parks = parksService.byCountry(country);
        system.debug(parks);
        return parks;

    }
    public static Double doAddCallout(Double a, Double b){
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double sum = calcService.doAdd(a, b);
        System.debug(a + ' add ' + b + ' = ' + sum);
        return sum;
    }
    public static Double doMultiplyCallout(Double a, Double b){
        CalculatorServices.CalculatorImplPort calcService1 = new CalculatorServices.CalculatorImplPort();
        Double multiply = calcService1.doMultiply(a, b);
        System.debug(a + ' multiply ' + b + ' = ' + multiply);
        return multiply;
    }
}