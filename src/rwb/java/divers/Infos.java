package rwb.java.divers;

import java.util.List;

import org.virtualbox_5_0.IGuestOSType;
import org.virtualbox_5_0.IMachine;
import org.virtualbox_5_0.IVirtualBox;


public class Infos {
	
	private IVirtualBox vbox;
	
	/**
	 * 
	 * @param vbox
	 */
	public Infos(IVirtualBox vbox){
		this.vbox = vbox;
	}
	
	/**
	 * 
	 * @return
	 */
	public List<IGuestOSType> getListOS(){
		List<IGuestOSType> listOS = this.vbox.getGuestOSTypes();
		for (IGuestOSType os:listOS){
			Log.info(os.getId());
		}
		return listOS;
	}
	
	/**
	 * 
	 * @return
	 */
	public List<IMachine> getAllIMachines(){
		List<IMachine> machines = this.vbox.getMachines();
		for(IMachine m:machines){
			Log.info(m.getName());
		}
		return machines;
	}
	
	/**
	 * 
	 * @return
	 */
	public String[] getAllAttributsMachine(){
		return new String[]{"getAccelerate3DEnabled",
			"getAccessible",
			"getAudioAdapter",
			"getBIOSSettings",
			"getBootOrder",
			"getClipboardMode",
			"getCPUCount",
			"getCurrentSnapshot",
			"getCurrentStateModified",
			"getDescription",
			"getDVDDrive",
			"getExtraData",
			"getFloppyDrive",
			"getHardDiskAttachments",
			"getHardwareVersion",
			"getHWVirtExEnabled",
			"getHWVirtExNestedPagingEnabled",
			"getHWVirtExVPIDEnabled",
			"getId",
			"getLastStateChange",
			"getLogFolder",
			"getMemoryBalloonSize",
			"getMemorySize",
			"getMonitorCount",
			"getName",
			"getNextExtraDataKey",
			};
	}
}
