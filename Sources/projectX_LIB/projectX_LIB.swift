import Darwin

public struct projectX_LIB {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}
struct pxe3_key
{
    var subKeyLength : UInt64
    var subkeys : [String]
    
    func genKey()
    {
    }
    
    func encrypt(msg : String)
    {
    }
    
    func decrypt(cypher : String)
    {
    }
}

struct pxAPI_flags
{
    var NO_CHECK : Bool
    var NO_CHECK_PERMISSION : Bool
    var NO_CHECK_PERMISSION_SERVER : Bool
    var PRIORITY_HIGH : Bool
    var NO_RETURN : Bool
    var LOG_PSEUDO : Bool
    var PRIORITY_LOW : Bool
    var NO_ENCRYPT : Bool
    var BYPASS_2FA : Bool
    var BYPASS_PRIVACY_SETTINGS : Bool
    var PRIORITY_REALTIME : Bool
    
    func toString() -> String
    {
        var ret : String = ""
        if(self.NO_CHECK){
            ret+="1"
        }else{
            ret+="0"
        };if(self.NO_CHECK_PERMISSION){
            ret+="1"
        }else{
            ret+="0"
        };if(self.NO_CHECK_PERMISSION_SERVER){
            ret+="1"
        }else{
            ret+="0"
        };if(self.PRIORITY_HIGH){
            ret+="1"
        }else{
            ret+="0"
        };if(self.NO_RETURN){
            ret+="1"
        }else{
            ret+="0"
        };if(self.LOG_PSEUDO){
            ret+="1"
        }else{
            ret+="0"
        };if(self.PRIORITY_LOW){
            ret+="1"
        }else{
            ret+="0"
        };if(self.NO_ENCRYPT){
            ret+="1"
        }else{
            ret+="0"
        };if(self.BYPASS_2FA){
            ret+="1"
        }else{
            ret+="0"
        };if(self.BYPASS_PRIVACY_SETTINGS){
            ret+="1"
        }else{
            ret+="0"
        };if(self.PRIORITY_REALTIME){
            ret+="1"
        }else{
            ret+="0"
        };
        return ret;
    }
}

struct pxAPI_user
{
    var email : String
    var password : String
    var IID : String
}

func pxAPI_send(
    flags : pxAPI_flags,
    RTID : String,
    IID : String,
    parameters : String) -> String
{
    var APIr : String = ""
    APIr += flags.toString()
    APIr += IID
    APIr += RTID
    APIr += parameters
    
    return "0x0000"
}

func pxAPI_HELPER_FILL(parameter : String, nLength : UInt64) -> String
{
    var result : String = parameter;
    while(strlen(result)<nLength)
    {
        result+=String(UnicodeScalar(1))
    }
    
    return result;
}

func pxAPI_login(user:pxAPI_user,flags : pxAPI_flags) -> String
{
    return pxAPI_send(flags: flags,RTID: "0001",IID: user.IID,parameters: String(
        pxAPI_HELPER_FILL(parameter: user.email, nLength: 100)+pxAPI_HELPER_FILL(parameter: user.password, nLength: 100)))
}
