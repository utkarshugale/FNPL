public class LineReader 
    implements Iterator<string>, Iterable<string> {       
    private String LINE_SEPARATOR = '\n';

    private String textData;

    public LineReader(String textData) {       
        this.textData = textData;
    }

    public Boolean hasNext() {
        return textData.length() > 0 ? true : false;
    }   

    public String next() {
        String row = null;
        Integer endPos = textData.indexOf(LINE_SEPARATOR);
        System.debug(LoggingLevel.ERROR,' Index of LF '+endPos);
        if(endPos == -1) {
            row = textData;
            textData = '';
        }else {
            row = textData.subString(0, endPos);
            textData = textData.subString(endPos + LINE_SEPARATOR.length(), textData.length());             
        }
        return row;
    }

    public Iterator<String> Iterator() {
        return this;   
    }           
}