package dksw.model.domain;

public class MemberToken {

    private int dkswMemberNo;
    private int dkswMemberTokenDevice; /* 0 : 알수 없음, 1 : 안드로이드, 2: 아이폰 */
    private long dkswMemberTokenDate; /* 생성날짜 혹은 변경날짜 */
    private String dkswMemberTokenKey;

    public int getDkswMemberNo() {
        return dkswMemberNo;
    }

    public void setDkswMemberNo(int dkswMemberNo) {
        this.dkswMemberNo = dkswMemberNo;
    }

    public int getDkswMemberTokenDevice() {
        return dkswMemberTokenDevice;
    }

    public void setDkswMemberTokenDevice(int dkswMemberTokenDevice) {
        this.dkswMemberTokenDevice = dkswMemberTokenDevice;
    }

    public long getDkswMemberTokenDate() {
        return dkswMemberTokenDate;
    }

    public void setDkswMemberTokenDate(long dkswMemberTokenDate) {
        this.dkswMemberTokenDate = dkswMemberTokenDate;
    }

    public String getDkswMemberTokenKey() {
        return dkswMemberTokenKey;
    }

    public void setDkswMemberTokenKey(String dkswMemberTokenKey) {
        this.dkswMemberTokenKey = dkswMemberTokenKey;
    }

    public MemberToken(int dkswMemberNo, int dkswMemberTokenDevice, long dkswMemberTokenDate, String dkswMemberTokenKey) {
        this.dkswMemberNo = dkswMemberNo;
        this.dkswMemberTokenDevice = dkswMemberTokenDevice;
        this.dkswMemberTokenDate = dkswMemberTokenDate;
        this.dkswMemberTokenKey = dkswMemberTokenKey;
    }
}
