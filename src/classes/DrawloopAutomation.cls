@RestResource(urlMapping='/generateDocuments/*')
global with sharing class DrawloopAutomation {

    static String  sessionId = UserInfo.getSessionId();
    
    @HttpPost
    global static Response generateDDP(){
        String deployId;
        String templateId;
        String contractId;
        RestRequest req = RestContext.request;
        RestResponse restRes = RestContext.response;
        Response res = new Response();
        System.debug('Req: '+req );
        try {
            RequestBodyParser.RequestBodyParams reqParams = RequestBodyParser.getJsonParamsFromRequest(req);
            Map<String, Object> params = reqParams.getParams();
            system.debug('Params: '+params );
            
          /*  deployId = req.params.get('deployId') != null ? req.params.get('deployId') : null;
            templateId = req.params.get('templateId') != null ? req.params.get('templateId') : null;
            contractId = req.params.get('contractId') != null ? req.params.get('contractId') : null; */
            
            deployId = (String)params.get('deployId');
            templateId = (String)params.get('templateId');
            contractId = (String)params.get('contractId');
            
            System.debug('Deploy Id: '+deployId);
            System.debug('Template Id: '+templateId);
            System.debug('Contract Id: '+contractId);
                if(deployId!=null && templateId!=null && contractId !=null && sessionId!=null){
                Map<string, string> variables = new Map<string,string>();
                variables = new Map<string, string> { 'deploy' => deployId };
                Loop.loopMessage lm = new Loop.loopMessage();
                lm.sessionId=sessionId;
                System.debug('session ID: '+lm.sessionId);
                lm.requests.add(new Loop.loopMessage.loopMessageRequest(contractId,templateId,variables));
                lm.sendAllRequests(); 
            }
            return res;          
        } catch (Exception e) {
            res.errorCode = peer.Constants.INVALID_INPUT;
            res.status = peer.Constants.ERROR;
            restRes.statuscode = peer.Constants.HTTP_BAD_REQUEST;
            res.errorMessage = 'UNABLE_PARSE_REQ_PARAMS';           
            return res;
        } 
        
        
    }
  
}