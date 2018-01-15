package rwb.selenium.log;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import rwb.selenium.log.TestLogin;

@RunWith(Suite.class)
@SuiteClasses({ TestLogin.class, TestLogout.class })
public class LoginTestSuite {
}
