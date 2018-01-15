package rwb.java.divers;

import org.junit.Assert;
import org.junit.Test;

public class AESTest {

	@Test
	public void encryptDecryptTest() {
		Assert.assertEquals("Yplbp+swGYYB5FhMlV4ntg==", AES.encrypt("test", "truc"));
		Assert.assertEquals("test", AES.decrypt("Yplbp+swGYYB5FhMlV4ntg==", "truc"));

		Assert.assertNull(AES.decrypt(null, "truc"));
		Assert.assertNull(AES.encrypt(null, "truc"));
	}

}
