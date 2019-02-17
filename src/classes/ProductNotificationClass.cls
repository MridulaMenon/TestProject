public class ProductNotificationClass {
	
   
    public ProductNotificationClass() {
    }
    
    @AuraEnabled
    public static ProductInformation__c createProductDB (ProductInformation__c product){
        
        try{
            System.debug('Product details'+product);
            
            if(product != null){
                insert product;
            }
            
            
        } catch (Exception ex){
            
        }
        return product;
    }
}