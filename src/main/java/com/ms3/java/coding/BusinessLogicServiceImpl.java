package com.ms3.java.coding;

import org.springframework.stereotype.Service;

@Service
public class BusinessLogicServiceImpl implements BusinessLogicService {
	
	public enum ValueEnum {
		MS3("MS3"),
		ME("ME"),
		MS3_and_ME("MS3 and ME");
		
		private final String text;

	    /**
	     * @param text
	     */
	    private ValueEnum(final String text) {
	        this.text = text;
	    }

	    /* (non-Javadoc)
	     * @see java.lang.Enum#toString()
	     */
	    @Override
	    public String toString() {
	        return text;
	    }
	}

	//This method generate the values for each key
	public FinalResponse processNumbers(RangeObject range) {
		// TODO Auto-generated method stub
		FinalResponse finalResponse = new FinalResponse();
		int minNum = 0;
		if(range != null){
			minNum = range.getMin();
			while(minNum <= range.getMax()){
				ResponseObject response = new ResponseObject();
				if(minNum%7 == 0 && minNum%3 == 0){
					response.setNumber(minNum);
					response.setValue(ValueEnum.MS3_and_ME.toString());
					finalResponse.getListOfValues().add(response);
				}else if(minNum%3 == 0){
					response.setNumber(minNum);
					response.setValue(ValueEnum.ME.toString());
					finalResponse.getListOfValues().add(response);
				}else if(minNum%7 == 0){
					response.setNumber(minNum);
					response.setValue(ValueEnum.MS3.toString());
					finalResponse.getListOfValues().add(response);
				}
				minNum = minNum + 1;
			}
		}
		return finalResponse;
	}

}
