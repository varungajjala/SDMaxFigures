package controllers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

@Controller
public class MainController { 

Double SQRTOF2 = Math.sqrt(2);

@RequestMapping(value="/",method=RequestMethod.GET)
public String printHello(Model model){	

	return "AssignmentNew";	
}

@RequestMapping(value="/",method=RequestMethod.POST, params={"calcube"})
public String getInputs(Model model, @RequestParam("inp-length") String givenLength,@RequestParam("output-units") String outType,@RequestParam("inp-units") String inpType2, @RequestParam("inp-width") String breadth, @RequestParam("inp-height") String height) throws UnirestException{	
	
	String tempResult,stanGivenLength,stanGivenBreadth,stanGivenHeight,volume,inpType = null,stanType = null;
	String[] sidesofCubes = new String[3];
	if(outType.equals(inpType2))
	{
		inpType = outType;
		stanType = inpType;	
	}
	else
	{
		inpType = inpType2;
		stanType = outType;
	}
	
	stanGivenLength=restService(inpType,stanType,givenLength);	
	stanGivenBreadth=restService(inpType,stanType,breadth);	
	stanGivenHeight=restService(inpType,stanType,height);	
	tempResult=getCubeSides(stanGivenLength, stanGivenBreadth,stanGivenHeight);
	sidesofCubes = tempResult.split(";"); 
	volume=getVolume(sidesofCubes[0]);	
	
	model.addAttribute("volume",volume);
	model.addAttribute("side", sidesofCubes[0]);
	model.addAttribute("sidelen1", sidesofCubes[1]);
	model.addAttribute("sidelen2", sidesofCubes[2]);
	model.addAttribute("message","Please cut the wood in the following way: ");
	model.addAttribute("message1","8 pieces of length "+sidesofCubes[1]+" units and 4 pieces of length "+sidesofCubes[2] + " units and arrange them as displayed below");
	return "cubeDisplay";	
}

@RequestMapping(value="/",method=RequestMethod.POST, params={"caltri"})
public String getTriInputs(Model model, @RequestParam("inp-length") String givenLength,@RequestParam("output-units") String outType,@RequestParam("inp-units") String inpType2, @RequestParam("inp-width") String breadth, @RequestParam("inp-height") String height) throws UnirestException{	
	
	String stanGivenLength, tempResult2,volume2,inpType = null,stanType = null;
	if(outType.equals(inpType2))
	{
		inpType = outType;
		stanType = inpType;
	}
	else
	{
		inpType = inpType2;
		stanType = outType;	
	}
	
	stanGivenLength=restService(inpType,stanType,givenLength);	
	tempResult2=getTPiramidSide(stanGivenLength);
	volume2=getTPiramidVolume(tempResult2);		
	
	model.addAttribute("side", tempResult2);
	model.addAttribute("sidelen1",tempResult2);
	model.addAttribute("volume",volume2);	
	model.addAttribute("message","Please cut the wood in the following way: ");
	model.addAttribute("message1","6 pieces of length "+tempResult2+" units at an angle of 54.7 in zigzag order as shown below and arrange them as displayed below");
	return "triangularDisplay";	
}

@RequestMapping(value="/",method=RequestMethod.POST, params={"calrect"})
public String getRectInputs(Model model, @RequestParam("inp-length") String givenLength,@RequestParam("output-units") String outType,@RequestParam("inp-units") String inpType2, @RequestParam("inp-width") String breadth, @RequestParam("inp-height") String height) throws UnirestException{	
	
	String stanGivenLength, stanGivenBreadth, tempResult1,volume1,inpType = null,stanType = null;
	String[] sidesofRpyr = new String[3];
	if(outType.equals(inpType2))
	{
		inpType = outType;
		stanType = inpType;	
	}
	else
	{
		inpType = inpType2;
		stanType = outType;
	}
	
	stanGivenLength=restService(inpType,stanType,givenLength);
	stanGivenBreadth=restService(inpType,stanType,breadth);
	
	tempResult1=getRPiramidSide(stanGivenLength, stanGivenBreadth);
	sidesofRpyr = tempResult1.split(";"); 
	volume1=getRPiramidVolume(sidesofRpyr[0]);
	
	model.addAttribute("side", sidesofRpyr[0]);
	model.addAttribute("sidelen1", sidesofRpyr[1]);
	model.addAttribute("sidelen2", sidesofRpyr[2]);
	model.addAttribute("volume",volume1);	
	model.addAttribute("message","Please cut the wood in the following way: ");
	model.addAttribute("message1","4 pieces of length "+sidesofRpyr[1]+" units and 4 pieces of length "+sidesofRpyr[2]+ " units and arrange them as displayed below");
	
	return "rectangularDisplay";	
}


public String restService(String from,String to,String Value) throws UnirestException
{
	HttpResponse<JsonNode> response = Unirest.post("https://community-neutrino-currency-conversion.p.mashape.com/convert")
			.header("X-Mashape-Key", "TXMOW2ow3EmshbvLgXasCNndj5w9p12g81FjsnYHZTfJS5tfm4")
			.header("Content-Type", "application/x-www-form-urlencoded")
			.header("Accept", "application/json")
			.field("from-type", from)			
			.field("from-value", Value)
			.field("to-type", to)
			.asJson();		
		org.json.JSONObject obj1 = response.getBody().getObject();
	return	obj1.get("result").toString();	
}

public String getCubeSides(String standLength, String standBreadth, String standHeight)
{
	Double givenLength=Double.parseDouble(standLength);
	Double givenBreadth=Double.parseDouble(standBreadth);
	Double givenHeight=Double.parseDouble(standHeight);
	
	Double length1 = (givenLength - (4*givenBreadth) + (8*givenHeight))/12;
	Double length2 = (givenLength + (8*givenBreadth) - (16*givenHeight))/12;
	Double sideOfCube = length1 + givenBreadth;
	
	String result = sideOfCube.toString() + ";" + length1.toString() + ";" + length2.toString();
	return result;	
}
public String getVolume(String finalResult)
{
	Double temp=Double.parseDouble(finalResult);
	temp=temp*temp*temp;
	return temp.toString();	
}
public String getRPiramidSide(String standLength, String standBreadth) 
{
	Double givenLength=Double.parseDouble(standLength);
	Double givenBreadth=Double.parseDouble(standBreadth);
	
	Double length1 = (givenLength - (4*givenBreadth))/8;
	Double length2 = (givenLength + (4*givenBreadth))/8;
	Double sideOfRpyr = length1 + givenBreadth;
	
	String result = sideOfRpyr.toString() + ";" + length1.toString() + ";" + length2.toString();
	return result;	
}
public String getRPiramidVolume(String tempResult)
{
	Double lengthOfSideOfTriangle = Double.parseDouble(tempResult);
	Double volumeOfRPiramid = (lengthOfSideOfTriangle*lengthOfSideOfTriangle*lengthOfSideOfTriangle*SQRTOF2)/6;
	return volumeOfRPiramid.toString();
}
public String getTPiramidSide(String length) 
{
	Double lengthOfRod = Double.parseDouble(length);
	Double lengthOfSideOfTriangle = lengthOfRod/6;
	return lengthOfSideOfTriangle.toString();
}
public String getTPiramidVolume(String tempResult)
{
	Double lengthOfSideOfTriangle = Double.parseDouble(tempResult);
	Double volumeOfRPiramid = (lengthOfSideOfTriangle*lengthOfSideOfTriangle*lengthOfSideOfTriangle)/(6*SQRTOF2);
	return volumeOfRPiramid.toString();
}
}
