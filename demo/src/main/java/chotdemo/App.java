package chotdemo;

import java.io.*;
import org.apache.logging.log4j.*;

public class App {
    public static final Logger LOG = LogManager.getLogger();

    public static void main(String[] args) throws IOException, InterruptedException {
        LOG.info("指定一个大目录，让输出占满缓冲。");
        String cmd = "cmd /c dir /s C:\\Windows";
        int v = run(cmd, LOG);
        LOG.info("{}", v);
    }

    private static int run(String cmd, Logger logger) throws IOException, InterruptedException {
        Process p = Runtime.getRuntime().exec(cmd);
        printMessage(p.getInputStream(), logger);
        printMessage(p.getErrorStream(), logger);
        int r = p.waitFor();
        p.destroy();
        return r;
    }

    private static Thread printMessage(InputStream input, Logger logger) {
        Thread t = new Thread(() -> {
            Reader reader = new InputStreamReader(input);
            BufferedReader br = new BufferedReader(reader);
            String line = null;
            try {
                while ((line = br.readLine()) != null) {
                    logger.info(line);
                }
            } catch (IOException e) {
                logger.info(e.getStackTrace());
            }
        });
        t.start();
        return t;
    }
}
