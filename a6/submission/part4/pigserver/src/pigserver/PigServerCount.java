package pigserver;
import java.io.IOException;
import org.apache.pig.PigServer;

/**
 * Created by weiweisu on 6/27/15.
 */
public class PigServerCount {

    public static void main(String[] args) throws IOException {

        PigServer pigServer = new PigServer("local");

        try {
            //pigServer.registerJar("/mylocation/tokenize.jar");
            runMyQuery(pigServer, "data/access.log");
        }
        catch (IOException e) {
        }
    }

    public static void runMyQuery(PigServer pigServer, String inputFile) throws IOException {
        pigServer.registerQuery("A = LOAD '" + inputFile + "' using PigStorage(' ')  AS (IP,id,frank,time1,time2,requestA,requestB,requestC,response,size);");
        pigServer.registerQuery("B= GROUP A BY IP;");
        pigServer.registerQuery("C= FOREACH B GENERATE $0 AS ip, COUNT(A) as count;");

        pigServer.store("C", "data/myoutput");
    }

}
