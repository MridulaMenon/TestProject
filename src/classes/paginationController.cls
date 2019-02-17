public class paginationController {
    public List<Account> listAccts{get;set;}
    public List<Account> acctsize {get;set;}
    public Set<Id> accountid {get;set;}
    public Integer limits=5;
    public Integer counter=0;
    public Integer recSize =0;
    
    public paginationController(){
        listAccts =new List<Account>();
        acctsize =new List<Account>();
        accountid=new Set<Id>();
        Result();
    }
    
    public void Result(){
        acctsize=[select Id,Name,BillingCity from Account where name!=null];
        system.debug('ACCT size*******************'+acctsize);
        recSize=acctsize.size();
        System.debug('SIzeeeeeeeeeeeee'+acctsize.size());
    }
    public void searchResult(){
        listAccts =[select Id,Name,BillingCity from Account where Id =: accountid and Name!=null LIMIT :limits OFFSET :counter ];
        system.debug('listAccts*******************************'+listAccts);
    }
    public void nextBtn(){
        counter+=limits;
        system.debug('counter&&&&&&'+counter);
        system.debug('limits^^^^^^^'+limits);
        searchResult();
    }
    public void prevBtn(){
        counter-=limits;
        system.debug('counter&&&&&&'+counter);
        system.debug('limits^^^^^^^'+limits);
        searchResult();
    }
    public void firstBtn(){
        counter=0;
        system.debug('counter&&&&&&'+counter);
        system.debug('limits^^^^^^^'+limits);
        searchResult();
    }
    public void Lastbtn(){
        counter = recSize - math.mod(recSize,limits);
        system.debug('counter&&&&&&'+counter);
        system.debug('limits^^^^^^^'+limits+'recSize%%%%%%'+recSize);
        searchResult();
        
    }
}