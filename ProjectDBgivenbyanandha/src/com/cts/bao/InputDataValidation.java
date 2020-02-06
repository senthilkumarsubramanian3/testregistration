package com.cts.bao;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import com.cts.vo.BookDetails;
@Component
public  class InputDataValidation implements Validator 
{
   public boolean supports(Class clazz) {
       return BookDetails.class.isAssignableFrom(clazz);
   }
   /*Empty data validation*/
  public  void validate(Object target, Errors errors) 
   {
	  BookDetails obj1= (BookDetails) target;
   /*    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.data");*/
       ValidationUtils.rejectIfEmptyOrWhitespace(errors, "date", "required.date");
       ValidationUtils.rejectIfEmptyOrWhitespace(errors, "place", "required.place");
       ValidationUtils.rejectIfEmptyOrWhitespace(errors, "slot", "required.slot");
       ValidationUtils.rejectIfEmptyOrWhitespace(errors, "level", "required.level");  
/*       try{
  
   int a=Integer.parseInt(obj1.getName());
   if((a>100000)&&(a<800000)){
	   
   }
   else{
	   errors.rejectValue("name",  "required.namevalidatebook");  
   }
       }
       catch(Exception e){
    	   errors.rejectValue("name",  "required.namevalidatebook");
       }*/
}
 /* Date validation*/
  @SuppressWarnings("deprecation")
public void validatedate(Object target,Errors errors) throws ParseException{
		BookDetails obj1= (BookDetails) target;
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		  Date date=new Date();
	  java.util.Date date1 = sdf.parse(obj1.getDate());
	  java.util.Date date2 = sdf.parse(sdf.format(date));
	  sdf.format(date1);
	  sdf.format(date2);
	  if ((date1.compareTo(date2) < 0)||(date1.getYear()>121)) {
		  errors.rejectValue("date",  "required.date1");
	  } 	
	}
}
