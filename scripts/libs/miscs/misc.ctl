// $License: NOLICENSE
//--------------------------------------------------------------------------------
/**
  @file $relPath
  @copyright $copyright
  @author z004kzwa
*/

//--------------------------------------------------------------------------------
// Libraries used (#uses)

//--------------------------------------------------------------------------------
// Variables and Constants


//--------------------------------------------------------------------------------
//@public members
//--------------------------------------------------------------------------------


//--------------------------------------------------------------------------------
//@private members
private mapping colorMapping = makeMapping(0,"SiemensStone",1,"_color_c_nack",2,"_color_c_ack",3,"_color_c_g_nack");
//--------------------------------------------------------------------------------

bool check_alert_act_deact_status(string dpe)
{
  bool result;
  dpGet(dpe+":_alert_hdl.._active",result);

  return result;
}

anytype get_color(string alertClass, int state)
{
  anytype color;
  dpGet(alertClass+":_alert_class.." + colorMapping.value(state),color);

  return color;
}

int get_color_state(string dpe)
{
  //0:Acknowledge-Passive, 1:Not Ack.-Active, 2:Ack.-Active, 3:NotAck.-Active
  int state;
  dpGet(dpe+":_alert_hdl.._act_state",state);

  return state;
}

string get_description(string dpe, bool val)
{
  string text;
  string alertText;

  text = dpGetDescription(dpe);
  if(text != dpe)
    return text;

  dpGet(dpe+":_original.._text",text);

  return text;
}
