function fn() {   
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'dlab02'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
    deep: '',
    history:'',
    DeepPublishWaiteTime : '' ,
    HistoryRetryWaiteTime : '',
    eventID1: '',
    rd1: '',
    date: '',
    startDate: '',
    endDate: '',

  };
  if (env == 'dlab02') {
    // over-ride only those that need to be

     config.deep = 'https://deep-gateway-development.dev.px-npe01.cf.t-mobile.com/development/deep/v1/events';

     var event_id=java.util.UUID.randomUUID() + '';
     
     config.DeepPublishWaiteTime = '30';
     config.HistoryRetryWaiteTime = '5';
      
     config.history = 'http://historyprocessor-dlab02-nmd.dev.px-npe01.cf.t-mobile.com/dnd/v1/notification?keys='+event_id;
     config.eventID1=event_id;
     
     karate.log('config.eventID1 Name:', config.eventID1);
     
  // Random 5 digit
     
     var Random_Data=(""+Math.random()).substring(2,7)
   config.rd1=Random_Data;
     
     karate.log('config.rd1:',   config.rd1);
     
   
 
     var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
     var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
     var date = new java.util.Date();
    
     config.date=sdf.format(date);
       
       karate.log('config.date:',  config.date);
       
       var sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        
       var result = new Date();
       var date2=  result.setDate(date.getDate() + 2);
       
       config.endDate=sdf1.format(date2);
         
         karate.log('config.date1:',  config.endDate);
        
         var date3=  result.setDate(date.getDate());
         
         config.startDate=sdf1.format(date3);
           
           karate.log('config.date1:',  config.startDate);
     
  } else if (env == 'dlab03') {
    config.deep = 'https://deep-gateway-development.dev.px-npe01.cf.t-mobile.com/dlab03/deep/v1/events';

    var event_id=java.util.UUID.randomUUID() + '';
    config.DeepPublishWaiteTime = '30';
    config.HistoryRetryWaiteTime = '5';
     
    config.history = 'http://historyprocessor-dlab03-nmd.dev.px-npe01.cf.t-mobile.com/dnd/v1/notification?keys='+event_id;  
    config.eventID1=event_id;
    
    karate.log('config.eventID1 Name:', config.eventID1);
    
 // Random 5 digit
    
    var Random_Data=(""+Math.random()).substring(2,7)
  config.rd1=Random_Data;
    
    karate.log('config.rd1:',   config.rd1);
    
  

    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    var date = new java.util.Date();
   
    config.date=sdf.format(date);
      
      karate.log('config.date:',  config.date);
      
      var sdf1 = new SimpleDateFormat("yyyy-MM-dd");
       
      var result = new Date();
      var date2=  result.setDate(date.getDate() + 2);
      
      config.endDate=sdf1.format(date2);
        
        karate.log('config.date1:',  config.endDate);
       
        var date3=  result.setDate(date.getDate());
        
        config.startDate=sdf1.format(date3);
          
          karate.log('config.date1:',  config.startDate);
    
    
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 50000);
  karate.configure('readTimeout', 50000);
  return config;
 
}

