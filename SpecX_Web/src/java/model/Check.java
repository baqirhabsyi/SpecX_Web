/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.*;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import config.Connect;
/**
 *
 * @author Baqir
 */
public class Check
{
    //calls the connection method
    Connect obj_con = new Connect();
    
    public String cMan, cCod, cSoc, cMod, cFre, cCor, cCac, gMan, gNam, gChi, gBus, gMem, gGClo, gMemClo, gShad, gRel, RAM, HDSize, HDFree, username, password;
    public String Code;
    
    String AppName, MinCpu, RecCpu, MinGpu, RecGpu;
    int MinCpuLvl, RecCpuLvl, MinGpuLvl, RecGpuLvl, MinRam, RecRam, result;

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }
    
    

    public String getCode() {
        return Code;
    }

    public void setCode(String Code) {
        this.Code = Code;
    }

    
    
    public String getAppName() {
        return AppName;
    }

    public void setAppName(String AppName) {
        this.AppName = AppName;
    }

    public String getRecCpu() {
        return RecCpu;
    }

    public void setRecCpu(String RecCpu) {
        this.RecCpu = RecCpu;
    }

    
    
    public String getMinCpu() {
        return MinCpu;
    }

    public void setMinCpu(String MinCpu) {
        this.MinCpu = MinCpu;
    }

    public String getMinGpu() {
        return MinGpu;
    }

    public void setMinGpu(String MinGpu) {
        this.MinGpu = MinGpu;
    }

    public String getRecGpu() {
        return RecGpu;
    }

    public void setRecGpu(String RecGpu) {
        this.RecGpu = RecGpu;
    }

    public int getMinCpuLvl() {
        return MinCpuLvl;
    }

    public void setMinCpuLvl(int MinCpuLvl) {
        this.MinCpuLvl = MinCpuLvl;
    }

    public int getRecCpuLvl() {
        return RecCpuLvl;
    }

    public void setRecCpuLvl(int RecCpuLvl) {
        this.RecCpuLvl = RecCpuLvl;
    }

    public int getMinGpuLvl() {
        return MinGpuLvl;
    }

    public void setMinGpuLvl(int MinGpuLvl) {
        this.MinGpuLvl = MinGpuLvl;
    }

    public int getRecGpuLvl() {
        return RecGpuLvl;
    }

    public void setRecGpuLvl(int RecGpuLvl) {
        this.RecGpuLvl = RecGpuLvl;
    }

    public int getMinRam() {
        return MinRam;
    }

    public void setMinRam(int MinRam) {
        this.MinRam = MinRam;
    }

    public int getRecRam() {
        return RecRam;
    }

    
    
    public void setRecRam(int RecRam) {
        this.RecRam = RecRam;
    }
    
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public Check() throws RemoteException
    {
        super();
    }
    
    
    public void setGameName(String GameName)
    {
        this.Code = GameName;
    }
    
    
    public String getGameName()
    {
        return this.Code;
    }
    
    
    public ArrayList setDisplay()
    {
        ArrayList<String> buatDisplay = new ArrayList<>();
        try
        {
            //get PC data from database
            Connection con = obj_con.Open();
            String getMyData = "select CPU_MHz, CPU_Total, CPU_Manufacturer, CPU_Name, GPU_Name, RAM_Amount, HDD_Space, HDD_FreeSpace from My_PC_Data";
            PreparedStatement ambil0 = con.prepareStatement(getMyData);
            
            ResultSet simpan0 = ambil0.executeQuery();
            simpan0.next();
            cMan = simpan0.getString("CPU_Manufacturer");
            cFre = simpan0.getString("CPU_Mhz");
            cCor = simpan0.getString("CPU_Total");
            cMod = simpan0.getString("CPU_Name");
            gNam = simpan0.getString("GPU_Name");
            RAM = simpan0.getString("RAM_Amount");
            HDSize = simpan0.getString("HDD_Space");
            HDFree = simpan0.getString("HDD_FreeSpace");
            
            //complete cpu data
            String getCpuData = "select Codename, Socket, CacheL1L2L3 from CPU_Data where Name = ?";
            PreparedStatement ambil1 = con.prepareStatement(getCpuData);
            ambil1.setString(1, cMod);
            
            ResultSet simpan1 = ambil1.executeQuery();
            simpan1.next();
            cCod = simpan1.getString("Codename");
            cSoc = simpan1.getString("Socket");
            cCac = simpan1.getString("CacheL1L2L3");
            
            //complete gpu data
            
            String getGpuData = "select Manufacturer, GPU_Chip, Released, Bus, Memory, GPU_Clock, Memory_Clock, ShadersTMUsROPs from GPU_Data where Name = ?";
            PreparedStatement ambil2 = con.prepareStatement(getGpuData);
            ambil2.setString(1, gNam);
            
            ResultSet simpan2 = ambil2.executeQuery();
            simpan2.next();
            
            gMan = simpan2.getString("Manufacturer");
            gChi = simpan2.getString("GPU_Chip");
            gBus = simpan2.getString("Bus");
            gMem = simpan2.getString("Memory");
            gGClo = simpan2.getString("GPU_Clock");
            gMemClo = simpan2.getString("Memory_Clock");
            gShad = simpan2.getString("ShadersTMUsROPs");
            gRel = simpan2.getString("Released");
            
            //store the data into arraylist
            buatDisplay.add(cMan);
            buatDisplay.add(cCod);
            buatDisplay.add(cSoc);
            buatDisplay.add(cMod);
            buatDisplay.add(cFre);
            buatDisplay.add(cCor);
            buatDisplay.add(cCac);
            buatDisplay.add(gMan);
            buatDisplay.add(gNam);
            buatDisplay.add(gChi);
            buatDisplay.add(gBus);
            buatDisplay.add(gMem);
            buatDisplay.add(gGClo);
            buatDisplay.add(gMemClo);
            buatDisplay.add(gShad);
            buatDisplay.add(gRel);
            buatDisplay.add(RAM);
            buatDisplay.add(HDSize);
            buatDisplay.add(HDFree);
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
        }
        return buatDisplay;
        
    }
    
    
    public int compareSpecs()
    {
        int i = 0;
        try
        {
            //get my pc data
            String CPU, GPU, RAM, CPU_Level, GPU_Level;
            
            Connection con = obj_con.Open();
            String ambilSpek = "select CPU_Name, GPU_Name, RAM_Amount from My_PC_Data";
            PreparedStatement ambil0 = con.prepareStatement(ambilSpek);
            ResultSet myData0 = ambil0.executeQuery();
            myData0.next();
            CPU = myData0.getString("CPU_Name");
            GPU = myData0.getString("GPU_Name");
            RAM = myData0.getString("RAM_Amount");
            
            //get component level from database
            String ambilLevel = "select c.LevelX, g.LevelY from CPU_Data c join GPU_Data g on c.Name = ? and g.Name = ?";
            PreparedStatement ambil1 = con.prepareStatement(ambilLevel);
            ambil1.setString(1, CPU);
            ambil1.setString(2, GPU);
            
            ResultSet myData1 = ambil1.executeQuery();
            myData1.next();
            CPU_Level = myData1.getString("LevelX");
            GPU_Level = myData1.getString("LevelY");
            
            //get level for the game requirements
            String gMin, gRec, cMin, cRec, rMin, rRec;
//            String gMin = "";
//            String gRec = "";
//            String cMin = "";
//            String cRec = "";
//            String rMin = "";
//            String rRec = "";
            
            //String ambilButuh = "select a.Code, a.AppReqGpuNameMin, a.AppReqGpuLevelMin, a.AppReqCpuNameMin, a.AppReqCpuLevelMin, a.AppReqRamMin, b.AppReqGpuNameRec, b.AppReqGpuLevelRec, b.AppReqCpuNameRec, b.AppReqCpuLevelRec, b.AppReqRamRec from required_Minimum a join required_Recomended b on a.Code = b.Code";
            
            String ambilMin = "select * from required_Minimum where Code = ?";
            String ambilRec = "select * from required_Recomended where Code = ?";
            
            PreparedStatement ambil99 = con.prepareStatement(ambilMin);
            PreparedStatement ambil98 = con.prepareStatement(ambilRec);
            
            ambil99.setString(1,Code);
            ambil98.setString(1,Code);
            
            ResultSet gameMin = ambil99.executeQuery();
            
            gameMin.next();
                gMin = gameMin.getString("AppReqGpuLevelMin");
                cMin = gameMin.getString("AppReqCpuLevelMin");
                rMin = gameMin.getString("AppReqRamMin");
            
            
            ResultSet gameRec = ambil98.executeQuery();
            
            gameRec.next();
                gRec = gameRec.getString("AppReqGpuLevelRec");
                cRec = gameRec.getString("AppReqCpuLevelRec");
                rRec = gameRec.getString("AppReqRamRec");
            
            
            //converts the level of the component into int
            int igMin, igRec, icMin, icRec, irMin, irRec, igMy, icMy, irMy;
            
            igMin = Integer.valueOf(gMin);
            igRec = Integer.valueOf(gRec);
            icMin = Integer.valueOf(cMin);
            icRec = Integer.valueOf(cRec);
            irMin = Integer.valueOf(rMin);
            irRec = Integer.valueOf(rRec);
            igMy = Integer.valueOf(GPU_Level);
            icMy = Integer.valueOf(CPU_Level);
            irMy = Integer.valueOf(RAM);
            
            //compare the levels of the commponents
            if (icRec <= icMy && igRec <= igMy && irRec <= irMy)
            {
                i = 3;
            }
            else
            {
                if(icMin <= icMy && igMin <= igMy && irMin <= irMy)
                {
                    i = 2;
                }
                else
                {
                    i = 1;
                }
            }  
        }
        catch(java.sql.SQLException e)
        {
            System.out.println(e);
        }
        return i;
    }
    
    
    //sets the variable to be saved to the database
    String Vendor, Model, Mhz, TotalCpu, CardName;
    int ramm;
    
    
    //calls the sigar packages
    //private Sigar sigar = new Sigar();

    
    public int getPCData() throws Exception
    {
        int i = 0;
        //opening connection
        Connection con = obj_con.Open();
        
        //sql query to insert new pc data
        String mew = "delete from My_PC_Data";
        String sql = "Insert into My_PC_Data(CPU_Name, RAM_Amount, HDD_Space, HDD_FreeSpace, GPU_Name) Values(?,?,?,?,?)";
        PreparedStatement mw = con.prepareStatement(mew);
        PreparedStatement sl = con.prepareStatement(sql);
        
        //calling the method used to get the PC Data
        //CpuInfo cek = new CpuInfo();
        
        //org.hyperic.sigar.CpuInfo[] infos = this.sigar.getCpuInfoList();
        
        //CpuPerc[] cpus = this.sigar.getCpuPercList();
        
        //org.hyperic.sigar.CpuInfo info = infos[0];
        
        //saving the data retrieved into variables
//        Vendor = cek.getVendor();
//        Model = cek.getModel();
//        //String Str = Model;
//        //Model = Model.substring(0, 17);
//        Mhz = Integer.toString(cek.getMhz());
//        TotalCpu = Integer.toString(cek.getTotalCores());
        
        //getting GPU values
        String filePath = "C:\\Users\\Baqir\\Documents\\CCIT\\2014\\Badrus\\testGPU.txt";
        //Use "dxdiag /t" variant to redirect output to a given file
        ProcessBuilder pb = new ProcessBuilder("cmd.exe","/c","dxdiag","/t",filePath);
        System.out.println("Getting GPU Data");
        try
        {
        Process p = pb.start();
        p.waitFor();
        }
        catch (IOException | InterruptedException ex)
        {
            ex.printStackTrace();
        }
        
        try
        {
            BufferedReader br = new BufferedReader(new FileReader(filePath));
            String line;
            //System.out.println(String.format("-- Printing %1$1s info --", filePath));
            while((line = br.readLine()) != null)
                {
                    if(line.trim().startsWith("Card name:"))
                    {
                        
                        CardName = line.trim().substring(11);
                        System.out.println(CardName);
                    }
                    if(line.trim().startsWith("Processor: "))
                    {
                        
                        Model = line.trim().substring(20, 38);
                        System.out.println(Model);
                        
                    }
                    if(line.trim().startsWith("Memory: "))
                    {
                        String ram;
                        ram = line.trim().substring(8, 12);
                        ramm = Integer.valueOf(ram);
                        System.out.println(ramm);
                    }
            
                }
            //String Str1 = CardName;
            //CardName = CardName.substring(11);
            //System.out.println(CardName);
            
        }
        catch(IOException err)
        {
            err.printStackTrace();
        }
        
//        //getting RAM values
//        Mem mem = null;
//        try
//        {
//            mem = sigar.getMem();
//        }
//        catch(SigarException se)
//        {
//            se.printStackTrace();
//        }
//        Long myRam;
//        myRam = mem.getRam();
//        Integer MyRam = myRam.intValue();
        
        //get Disk Space info
        File file = new File("c: ");
        Long totalSpace = file.getTotalSpace();
        Long freeSpace = file.getFreeSpace();
        
        totalSpace = totalSpace / 1024 / 1024 / 1024;
        freeSpace = freeSpace / 1024 / 1024 / 1024;
        
        Integer TotalSpace = totalSpace.intValue();
        Integer FreeSpace = freeSpace.intValue();
        
        //setting the values to be used in the prepared statement
        sl.setString(1, Model);
        sl.setInt(2, ramm);
        sl.setInt(3, TotalSpace);
        sl.setInt(4, FreeSpace);
        sl.setString(5, CardName);
        
        //executing prepared statements
        mw.executeUpdate();
        
        i = sl.executeUpdate();
        if(i!=0)
        {
            System.out.println("Data Successfully Saved");
        }
        else
        {
            System.out.println("Data Save Failed");
        }
        con.close();
        return i;
    }
    
    
    public ArrayList getGameNames()
    {
        ArrayList buatCombo = new ArrayList();
        try
        {
            Connection con = obj_con.Open();
            String sql = "select AppName from required_Specs";
            Statement stmt = con.createStatement();

            ResultSet names = stmt.executeQuery(sql);
            while(names.next())
            {
                String name = names.getString("AppName");
                buatCombo.add(name);
            }
        }
        catch(SQLException e)
        {
            System.out.println();
        }
        return buatCombo;
    }
    
    
    public ArrayList runitData()
    {
        ArrayList taroCoba = new ArrayList();
        try
        {
            //sets the variables to be stored on the arraylist
            String myCPU, myGPU, myRAM, myHDD, recCPU, recGPU, recRAM, recHDD, minCPU, minGPU, minRAM, minHDD;
            
            //sql connection
            Connection con = obj_con.Open();
            
            //sql string
            String sql = "select CPU_Name, GPU_Name, RAM_Amount, HDD_FreeSpace from My_PC_Data";
            
            //creating statement
            Statement stmt = con.createStatement();
            
            //creating resultset with the statement
            ResultSet sebuahSet = stmt.executeQuery(sql);
            
            //storing the resultset contents to variables
            sebuahSet.next();
            myCPU = sebuahSet.getString("CPU_Name");
            myGPU = sebuahSet.getString("GPU_Name");
            myRAM = sebuahSet.getString("RAM_Amount");
            //myHDD = sebuahSet.getString("myHDD");
            
            //getting game data using preparedstatement
            String ambilMin = "select * from required_Minimum where Code = ?";
            String ambilRec = "select * from required_Recomended where Code = ?";
            
            //setting the parameter so the data retrieved from the database are taken according to the game selected on the previous form
            PreparedStatement ambil99 = con.prepareStatement(ambilMin);
            PreparedStatement ambil98 = con.prepareStatement(ambilRec);
            
            //creating resultset, again
            ambil99.setString(1,Code);
            ambil98.setString(1,Code);
            
            ResultSet gameMin = ambil99.executeQuery();
            
            gameMin.next();
            minGPU = gameMin.getString("AppReqGpuNameMin");
            minCPU = gameMin.getString("AppReqCpuNameMin");
            minRAM = gameMin.getString("AppReqRamMin");
            
            
            ResultSet gameRec = ambil98.executeQuery();
            
            gameRec.next();
            recGPU = gameRec.getString("AppReqGpuNameRec");
            recCPU = gameRec.getString("AppReqCpuNameRec");
            recRAM = gameRec.getString("AppReqRamRec");
            
            //storing the variables to arraylist
            //myCPU, myGPU, myRAM, myHDD, recCPU, recGPU, recRAM, recHDD, minCPU, minGPU, minRAM, minHDD;
            
            taroCoba.add(myCPU);
            taroCoba.add(myGPU);
            taroCoba.add(myRAM);
            taroCoba.add(recCPU);
            taroCoba.add(recGPU);
            taroCoba.add(recRAM);
            taroCoba.add(minCPU);
            taroCoba.add(minGPU);
            taroCoba.add(minRAM);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return taroCoba;
    }
    
    public int doLogin()
    {
        int i = 0;
        try
        {
            ResultSet rs;
            Connection con = obj_con.Open();
            String sql = "select count(*) from userdata where username=? and password=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, username.trim());
            pr.setString(2, password.trim());
            
            rs = pr.executeQuery();
            if(rs.next())
            {
                i = rs.getInt(1);
            }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return i;
    }
    
    public int editGame()
    {
        int i = 0;
        try
        {
            Connect obj_con = new Connect();
            Connection con = obj_con.Open();
            String sql = "update required_Minimum set AppReqGpuNameMin=?, AppReqGpuLevelMin=?, AppReqCpuNameMin=?, AppReqCpuLevelMin=?, AppReqRamMin=? where Code=?";
            String sql1 = "update required_Recomended set AppReqGpuNameRec=?, AppReqGpuLevelRec=?, AppReqCpuNameRec=?, AppReqCpuLevelRec=?, AppReqRamRec=? where Code=?";
            
            PreparedStatement pr = con.prepareStatement(sql);
            PreparedStatement pr1 = con.prepareStatement(sql1);
            
            pr.setString(1, MinGpu.trim());
            pr.setInt(2, MinGpuLvl);
            pr.setString(3, MinCpu.trim());
            pr.setInt(4, MinCpuLvl);
            pr.setInt(5, MinRam);
            pr.setString(6, Code);
            
            pr1.setString(1, RecGpu.trim());
            pr1.setInt(2, RecCpuLvl);
            pr1.setString(3, RecCpu.trim());
            pr1.setInt(4, RecGpuLvl);
            pr1.setInt(5, RecRam);
            pr1.setString(6, Code);
            
            int a = pr.executeUpdate();
            int b = pr1.executeUpdate();
            
            if(a > 0 && b > 0)
            {
                i = 1;
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return i;
    }
    
    public int deleteGame()
    {
        int i = 0;
        
        try
        {
            int a, b, c;
            
            Connection con = obj_con.Open();
            
            String sql = "delete Application_Names where MinReqCode = ?";
            String sql1 = "delete required_Minimum where Code = ?";
            String sql2 = "delete required_Recomended where Code = ?";
            
            PreparedStatement pr = con.prepareStatement(sql);
            PreparedStatement pr1 = con.prepareStatement(sql1);
            PreparedStatement pr2 = con.prepareStatement(sql2);
            
            pr.setString(1, Code.trim());
            pr1.setString(1, Code.trim());
            pr2.setString(1, Code.trim());
            
            a = pr.executeUpdate();
            b = pr1.executeUpdate();
            c = pr2.executeUpdate();
            
            if(a > 0 && b > 0 && c > 0)
            {
                i = 1;
            }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        
        return i;
    }
}
