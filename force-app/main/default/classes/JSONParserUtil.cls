public with sharing class JSONParserUtil {
    /**
     * Helper method to convert JSON to a canonical object map.
     * 
     * @return a normalized Map of objects. Repeated elements are List values,
     *         sub-objects are Map values. All other types are String values.
     */
    public static Map<String,Object> jsonToMap(String jsonContent) {
        return jsonToMap(JSON.createParser(jsonContent));
    }
    
    /**
     * Helper method to convert JSON to a canonical object map.
     * 
     * @return a normalized Map of objects. Repeated elements are List values,
     *         sub-objects are Map values. All other types are String values.
     */
    private static Map<String,Object> jsonToMap(JSONParser parser) {
        Map<String,Object> mapped = new Map<String,Object>();
         
        if (parser.getCurrentToken()==null) {
            parser.nextToken(); // Advance to the start object marker.
        }

        if (parser.getCurrentToken() != JSONToken.START_OBJECT) {
            throw new JSONParseException('A JSON Object must start with \'{\'');
        }
        
        while (parser.nextToken() != null) {
            JSONToken curr = parser.getCurrentToken();
            
            if (curr == JSONToken.END_OBJECT) {
                // reached end of object
                break;

            } else if (curr == JSONToken.FIELD_NAME) {    
                String fieldName = parser.getText();
                curr = parser.nextToken();
                
                if (curr == JSONToken.START_OBJECT) {
                    // value is a JSON object
                    mapped.put(fieldName, jsonToMap(parser));

                } else if (curr == JSONToken.START_ARRAY) {
                    // value is a JSON array
                    mapped.put(fieldName, jsonToList(parser));

                }else if (curr == JSONToken.VALUE_NULL) {
                    mapped.put(fieldName, null);

                } else {
                    // value is a JSON primitive
                    mapped.put(fieldName, parser.getText());
                }

            } else {
                throw new JSONParseException('Unexpected JSON value: '+parser.getText());
            }
        }
        
        return mapped;
    }

    private static List<Object> jsonToList(JSONParser parser) {
        List<Object> jsonArray = new List<Object>();
        
        if (parser.getCurrentToken()==null) {
            parser.nextToken(); // Advance to the start object marker.
        }

        if (parser.getCurrentToken() != JSONToken.START_ARRAY) {
            throw new JSONParseException('A JSON Array must start with \'[\'');
        }
        
        while (parser.nextValue() != null) {
            JSONToken curr = parser.getCurrentToken();
            if (curr == JSONToken.END_ARRAY) {
                break;
            } else if (curr == JSONToken.START_ARRAY) {
                jsonArray.add(jsonToList(parser));
            } else if (curr == JSONToken.START_OBJECT){
                jsonArray.add(jsonToMap(parser));
            } else {
                jsonArray.add(parser.getText());
            }
        }
        return jsonArray;
    }   

    private class JSONParseException extends Exception {

    }

}