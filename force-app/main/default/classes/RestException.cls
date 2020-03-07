global with sharing class RestException extends Exception {

    /** The error code. */
    private Integer errorCode;
    
    /** The message. */
    private String message;
    
    /** The more info. */
    private String moreInfo;
    
    private Integer status;

    /**
     * Instantiates a new Customer API rest exception.
     *
     * @param message the message
     * @param errorCode the error code
     */
    public RestException (String message, Integer errorCode) {
        this(message, errorCode, null);
    }

    /**
     * Instantiates a new Customer API rest exception.
     *
     * param message the message
     * param errorCode the error code
     * param moreInfo the more info
     */
    public RestException (String message, Integer errorCode, String moreInfo) {
        this.message = message;
        this.errorCode = errorCode;
        this.moreInfo = moreInfo;
    }

    /**
     * Parses the response.
     *
     * @param response the response
     * @return the Customer API rest exception
     */
    public RestException (RestResponse response) {
    // Developer
      /*  Map<String, Object> data = response.toMap();
        String message = '';
        String moreInfo = null;
        Integer errorCode = null;

        if (response.isJson()) {
            message = (String) data.get('message');
            
            if (data.get('code') != null) {
                errorCode = Integer.valueOf(data.get('code'));
            }

            if (data.get('more_info') != null) {
                moreInfo = (String) data.get('more_info');
            }

            if (data.get('status') != null) {
                status = Integer.valueOf(data.get('status'));
            }
        }

        else if (response.isXML()) {
            // TODO add XML support some day
        }
        
        this.message = message;
        this.errorCode = errorCode;
        this.moreInfo = moreInfo;
        */
    }
    
}