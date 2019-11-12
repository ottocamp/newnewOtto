package reservation.model.vo;

import java.io.Serializable;

public class ReservationCount implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2135914736195978542L;
	private int rReStatus;
	private int rCount;
	
	
	public ReservationCount(int rReStatus, int rCount) {
		this.rReStatus = rReStatus;
		this.rCount = rCount;
	}


	public int getrReStatus() {
		return rReStatus;
	}


	public void setrReStatus(int rReStatus) {
		this.rReStatus = rReStatus;
	}


	public int getrCount() {
		return rCount;
	}


	public void setrCount(int rCount) {
		this.rCount = rCount;
	}


	@Override
	public String toString() {
		return "ReservationCount [rReStatus=" + rReStatus + ", rCount=" + rCount + "]";
	}
	
	
	
}
