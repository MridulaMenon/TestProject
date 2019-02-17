// ProductInformation Class//
public with sharing class ProductInformatonCls {
    
    public String pageId{get;set;}
    private ApexPages.StandardController controller;
    public List<Product_Information_Summary__c> lstproducts{get;set;}
    public Product_Information_Summary__c objPIS{get;set;}
    public List<ProductInformationWrapper> phsList{get;set;}
    public List<PHS__c> lstPHS{get;set;}
    
    public ProductInformatonCls() {
        
    }
     
    public ProductInformatonCls(ApexPages.StandardController controller) {
        this.controller=controller;
     pageId=Apexpages.currentPage().getParameters().get('Id');
     objPIS =new Product_Information_Summary__c();
     phsList = new List<ProductInformationWrapper>();
    /* objPIS=[SELECT Id,Name,Building__c,Department__c,New_PHM__c,OwnerId,Submitter_Name__c,Submit_Date__c,Scheduled_Start_Date__c,Submitter_Phone__c FROM Product_Information_Summary__c WHERE Id=:pageId];
     system.debug('Product Information Summary'+objPIS);
     
     lstPHS =[select ID,Chemical_Name__c,Product_Information_Summary__c,QA_LY_Number__c,Pictogram1__c from PHS__c where Product_Information_Summary__c =: pageId] ;
     system.debug('lstPHS'+lstPHS);
        for(PHS__c p:lstPHS){
            p.add(lstPHS);
            wrapPHS w=new wrapPHS();
           
        }*/
         
    }

    public PageReference save() {
     
     Product_Information_Summary__c pis = (Product_Information_Summary__c) controller.getRecord();
     upsert pis;
     List<PHS__c> lstPHS = new List<PHS__c>();
     for (ProductInformationWrapper wrap : phsList)
     {
         wrap.phs.Product_Information_Summary__c = pis.Id;
         lstPHS.add(wrap.phs);
     }
        IF(lstPHS.size()>0){
     insert lstPHS;     
    }
      return  new PageReference('/'+pageId);

 }
    
    
     public class ProductInformationWrapper

    {

        public PHS__c phs {get;set;} 
        public ProductInformationWrapper(){
            phs=new PHS__c();
        }
    } 
    
}