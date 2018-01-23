// paste.cs
// http://huddledmasses.org/jaykul/
// Joel 'Jaykul' Bennett

using System;
using System.Windows.Forms;
using System.Threading;

namespace Huddled {
   public class Paste {
      [STAThread]
      static void Main( string[] args )
      {
         foreach(string line in Clipboard.GetText().Split(
                                 new string[]{"\r\n","\n"},
                                 StringSplitOptions.None ))
            Console.WriteLine( line );
      }
   }
}
