@isTest
public class WebServiceMockWSSnail implements WebServiceMock {
   public void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {

            sessionservice.GetBindingsResponse_element respElement = new sessionservice.GetBindingsResponse_element();
            sessionservice.BindingResult bindingObj= new sessionservice.BindingResult();
            bindingObj.sessionServiceLocation = 'Mock response';
            bindingObj.submissionServiceLocation = 'Mock response';
            respElement.return_x = bindingObj;
            response.put('response_x', respElement); 

                         

        // Create response element from the autogenerated class.
        // Populate response element.
        // Add response element to the response parameter, as follows:
        //response.put('response_x', responseElement); 
   }
}