package controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

@Controller
public class MainControllerBkp { 

//	
//Double SQRTOF2 = Math.sqrt(2);
//
//@RequestMapping(value="/",method=RequestMethod.GET)
//public String printHello(Model model){	
//
//	return "AssignmentNew";	
//}
//
//@RequestMapping(value="/",method=RequestMethod.POST, params={"calcube"})
//public String getInputs(Model model, @RequestParam("inp-length") String givenLength,@RequestParam("output-units") String outType,@RequestParam("inp-units") String inpType2, @RequestParam("inp-width") String breadth, @RequestParam("inp-height") String height) throws UnirestException{	
//	
//	String tempResult,stanGivenLength,stanGivenBreadth,stanGivenHeight,finalResult,volume,tempResult1,tempResult2,finalResult1,finalResult2,volume1,volume2,inpType = null,stanType = null,inpValue = null;
//	String[] sidesofCubes = new String[3];
//	if(outType.equals(inpType2))
//	{
//		inpType = outType;
//		stanType = inpType;
//		stanGivenLength=restService(inpType,stanType,givenLength);	
//		stanGivenBreadth=restService(inpType,stanType,breadth);	
//		stanGivenHeight=restService(inpType,stanType,height);	
//		tempResult=getCubeSides(stanGivenLength, stanGivenBreadth,stanGivenHeight);
//		sidesofCubes = tempResult.split(";"); 
//		tempResult1=getRPiramidSide(stanGivenLength);
//		tempResult2=getTPiramidSide(stanGivenLength);
//		volume=getVolume(sidesofCubes[0]);
//		volume1=getRPiramidVolume(tempResult1);
//		volume2=getTPiramidVolume(tempResult2);		
//	}
//	else
//	{
//		inpType = inpType2;
//		stanType = outType;
//		stanGivenLength=restService(inpType,stanType,givenLength);	
//		stanGivenBreadth=restService(inpType,stanType,breadth);	
//		stanGivenHeight=restService(inpType,stanType,height);	
//		tempResult=getCubeSides(stanGivenLength, stanGivenBreadth, stanGivenHeight);
//		sidesofCubes = tempResult.split(";"); 
//		tempResult1=getRPiramidSide(stanGivenLength);
//		tempResult2=getTPiramidSide(stanGivenLength);		
//		volume=getVolume(sidesofCubes[0]);
//		volume1=getRPiramidVolume(tempResult1);
//		volume2=getTPiramidVolume(tempResult2);	
//		
//	}
//	model.addAttribute("length",givenLength);
//	model.addAttribute("width",breadth);
//	model.addAttribute("height",height);
//	model.addAttribute("volume",volume);
//	model.addAttribute("side", sidesofCubes[0]);
//	model.addAttribute("sidelen1", sidesofCubes[1]);
//	model.addAttribute("sidelen2", sidesofCubes[2]);
//	model.addAttribute("len",inpValue);
//	model.addAttribute("type",outType);
//	model.addAttribute("side1",tempResult1);
//	model.addAttribute("volume1",volume1);
//	model.addAttribute("side2",tempResult2);
//	model.addAttribute("volume2",volume2);	
//	model.addAttribute("message","Please cut the wood in the following way: ");
//	model.addAttribute("message1","8 pieces of length "+sidesofCubes[1]+" units and 4 pieces of length "+sidesofCubes[2] + " units and arrange them as displayed below");
//	return "cubeDisplay";	
//}
//public String restService(String from,String to,String Value) throws UnirestException
//{
//	HttpResponse<JsonNode> response = Unirest.post("https://community-neutrino-currency-conversion.p.mashape.com/convert")
//			.header("X-Mashape-Key", "TXMOW2ow3EmshbvLgXasCNndj5w9p12g81FjsnYHZTfJS5tfm4")
//			.header("Content-Type", "application/x-www-form-urlencoded")
//			.header("Accept", "application/json")
//			.field("from-type", from)			
//			.field("from-value", Value)
//			.field("to-type", to)
//			.asJson();		
//		org.json.JSONObject obj1 = response.getBody().getObject();
//	return	obj1.get("result").toString();	
//}
//
//public String getCubeSides(String standLength, String standBreadth, String standHeight)
//{
//	Double givenLength=Double.parseDouble(standLength);
//	Double givenBreadth=Double.parseDouble(standBreadth);
//	Double givenHeight=Double.parseDouble(standHeight);
//	
//	Double length1 = (givenLength - (4*givenBreadth) + (8*givenHeight))/12;
//	Double length2 = (givenLength + (8*givenBreadth) - (16*givenHeight))/12;
//	Double sideOfCube = length1 + givenBreadth;
//	
//	String result = sideOfCube.toString() + ";" + length1.toString() + ";" + length2.toString();
//	return result;	
//}
//public String getVolume(String finalResult)
//{
//	Double temp=Double.parseDouble(finalResult);
//	temp=temp*temp*temp;
//	return temp.toString();	
//}
//public String getRPiramidSide(String length) 
//{
//	Double lengthOfRod = Double.parseDouble(length);
//	Double lengthOfSideOfTriangle = lengthOfRod/8;
//	return lengthOfSideOfTriangle.toString();
//}
//public String getRPiramidVolume(String tempResult)
//{
//	Double lengthOfSideOfTriangle = Double.parseDouble(tempResult);
//	Double volumeOfRPiramid = (lengthOfSideOfTriangle*lengthOfSideOfTriangle*lengthOfSideOfTriangle*SQRTOF2)/6;
//	return volumeOfRPiramid.toString();
//}
//public String getTPiramidSide(String length) 
//{
//	Double lengthOfRod = Double.parseDouble(length);
//	Double lengthOfSideOfTriangle = lengthOfRod/6;
//	return lengthOfSideOfTriangle.toString();
//}
//public String getTPiramidVolume(String tempResult)
//{
//	Double lengthOfSideOfTriangle = Double.parseDouble(tempResult);
//	Double volumeOfRPiramid = (lengthOfSideOfTriangle*lengthOfSideOfTriangle*lengthOfSideOfTriangle)/(6*SQRTOF2);
//	return volumeOfRPiramid.toString();
//}
}
