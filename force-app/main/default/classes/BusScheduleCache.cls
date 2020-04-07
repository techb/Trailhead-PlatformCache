public with sharing class BusScheduleCache {
    private Cache.OrgPartition part;

    public BusScheduleCache() {
        this.part =  Cache.Org.getPartition('local.BusSchedule');
    }

    public void putSchedule(String busLine, Time[] schedule){
        this.part.put(busLine, schedule);
    }

    public Time[] getSchedule(String busLine){
        Time[] rtn = (Time[])this.part.get(busLine);
        Time[] rtn_fallback = new Time[]{Time.newInstance(8, 0, 0, 0), Time.newInstance(17, 0, 0, 0)};
        if(rtn != null){
            return rtn;
        }else{
            return rtn_fallback;
        }
    }
}
