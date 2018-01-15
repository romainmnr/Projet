package rwb.java.divers;

import java.util.HashMap;
import java.util.Map;
 

/**
 * Class contenant divers outils nécessaires au projet
 * 
 * @author Romain M.
 *
 */
public class Tools {

	private static final String OS_WIN_OTHER = "os_win_other.png";
	private static final String OS_LINUX_OTHER = "os_linux_other.png";
	private static final String WINDOWS = "windows";
	private static final String LINUX = "Linux";
	private static final String OS_MACOSX_64 = "os_macosx_64.png";
	private static final String OS_MACOSX = "os_macosx.png";
	private static final String MAC_OS_X = "Mac OS X";
	private static final String OS_OTHER = "os_other.png";
	private static final String OTHER = "Other";

	/**
	 * 
	 */
	private Tools() {
		// No need of constructor
	}

	/** 
	 * @return hashmap of OS 
	 */
	public static Map<String, HashMap<String, String>> getOS() {
		HashMap<String, HashMap<String, String>> os = new HashMap<>();

		// Windows hashmap
		HashMap<String, String> windows = new HashMap<>();

		windows.put("Windows31", "os_win31.png");
		windows.put("Windows95", "os_win95.png");
		windows.put("Windows98", "os_win98.png");
		windows.put("WindowsME", "os_winme.png");
		windows.put("WindowsNT4", "os_winnt4.png");
		windows.put("Windows2000", "os_win2k.png");
		windows.put("WindowsXP", "os_winxp.png");
		windows.put("WindowsXP_64", "os_winxp_64.png");
		windows.put("Windows2003", "os_win2k3.png");
		windows.put("Windows2003_64", "os_win2k3_64.png");
		windows.put("WindowsVista", "os_winvista.png");
		windows.put("WindowsVista_64", "os_winvista_64.png");
		windows.put("Windows2008", "os_win2k8.png");
		windows.put("Windows2008_64", "os_win2k8_64.png");
		windows.put("Windows7", "os_win7.png");
		windows.put("Windows7_64", "os_win7_64.png");
		windows.put("Windows8", "os_win8.png");
		windows.put("Windows8_64", "os_win8_64.png");
		windows.put("Windows81", "os_win81.png");
		windows.put("Windows81_64", "os_win81_64.png");
		windows.put("Windows10", "os_win10.png");
		windows.put("Windows10_64", "os_win10.png");
		windows.put("WindowsNT", OS_WIN_OTHER);
		windows.put("WindowsNT_64", OS_WIN_OTHER);
		windows.put("Windows2012_64", "os_win2k12_64.png");

		os.put(WINDOWS, windows);
		
		// Linux
		HashMap<String, String> linux = new HashMap<>();

		linux.put(LINUX, OS_LINUX_OTHER);
		linux.put("Linux_64", OS_LINUX_OTHER);
		linux.put("Linux22", "os_linux22.png");
		linux.put("Linux24", "os_linux24.png");
		linux.put("Linux24_64", "os_linux24_64.png");
		linux.put("Linux26", "os_linux26.png");
		linux.put("Linux26_64", "os_linux26_64.png");

		linux.put("Debian", "os_debian.png");
		linux.put("Debian_64", "os_debian_64.png");

		linux.put("Ubuntu", "os_ubuntu.png");
		linux.put("Ubuntu_64", "os_ubuntu_64.png");

		os.put(LINUX, linux);

		// OSX
		HashMap<String, String> osx = new HashMap<>();

		osx.put("MacOS106", OS_MACOSX);
		osx.put("MacOS1010", OS_MACOSX);
		osx.put("MacO", OS_MACOSX);

		osx.put("MacOS106_64", OS_MACOSX_64);
		osx.put("MacOS1010_64", OS_MACOSX_64);
		osx.put("MacO_64", OS_MACOSX_64);

		os.put(MAC_OS_X, osx);

		// Other
		HashMap<String, String> other = new HashMap<>();

		other.put("DOS", "os_dos.png");
		other.put(OTHER, OS_OTHER);
		other.put("VirtualBox_Host", "os_virtualbox.png");

		os.put(OTHER, other);

		return os;
	}

	/**
	 * 
	 * @param osTypeId
	 * @return
	 */
	public static String getOsType(String osTypeId) { 
		String type;
		switch (osTypeId.substring(0, 3)) {
		case "Win":
			type = WINDOWS;
			break;
		case "Lin":
		case "Deb":
		case "Ubu":
			type = LINUX;
			break;
		case "Mac":
			type = MAC_OS_X;
			break;
		case "Oth":
			type = OTHER;
			break;
		default:
			type = OTHER;
			break; 
		}
		return type;
	}

	/** 
	 * @param osTypeId
	 * @return
	 */
	public static String getOsIcon(String osTypeId) {
		String ico;
		String val = ""; 
		HashMap<String, HashMap<String, String>> map = (HashMap<String, HashMap<String, String>>) getOS();
		HashMap<String, String> mapFine;
		if (!"".equals(osTypeId)) {
			val = osTypeId.substring(0, 3);
		}
		switch (val) {
		case "Win":
			mapFine = map.get(WINDOWS);
			ico = OS_WIN_OTHER; 
			ico = getOsIconSub(mapFine,osTypeId,ico);
			break;
		case "Lin":
		case "Deb":
		case "Ubu":
			mapFine = map.get(LINUX);
			ico = OS_LINUX_OTHER;
			ico = getOsIconSub(mapFine,osTypeId,ico);
			break;
		case "Mac":
			mapFine = map.get(MAC_OS_X);
			ico = OS_MACOSX;
			ico = getOsIconSub(mapFine,osTypeId,ico);
			break;
		case "Oth":
		case "DOS":
			mapFine = map.get(OTHER);
			ico = OS_OTHER;
			ico = getOsIconSub(mapFine,osTypeId,ico);
			break;
		default:
			ico = OS_OTHER;
			break; 
		} 
		return ico;
	}

	/**
	 * 
	 * @param mapFine
	 * @param osTypeId
	 * @param ico
	 * @return
	 */
	private static String getOsIconSub(HashMap<String, String> mapFine, String osTypeId, String ico) {
		for (Map.Entry<String, String> e : mapFine.entrySet()) {
			if (e.getKey().equals(osTypeId)) {
				return e.getValue();
			}
		}
		return ico;
	}

	/**
	 * 
	 * @param bytes
	 * @param si
	 * @return
	 */
	public static String convertSize(long bytes, boolean si) {
		int unit = si ? 1000 : 1024;
		if (bytes < unit)
			return bytes + " B";
		int exp = (int) (Math.log(bytes) / Math.log(unit));
		String pre = (si ? "kMGTPE" : "KMGTPE").charAt(exp - 1) + (si ? "" : "i");
		return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
	}

	/** 
	 * @param value in Mo
	 * @return
	 */
	public static long getRAMValue(long in) {
		if (in % 512 == 0) {
			return in;
		} else {
			return in - in % 512;
		}
	} 
	
	/** 
	 * @param value in Go
	 * @return real value in Octect
	 */
	public static long getHDDValue(long go) {
		return go * 1073741824;
	} 
}
