import os                   # Operating-system interface
import subprocess           # To run other programs
import win32com.client      # To communicate with other programs via OLE
                            # Automation
import datetime

def stage1():
    " Run the analysis in R "
    print("**************")
    print("Running stage1")
    r_path = 'c:\\Program Files\\R\\R-2.15.0\\bin\\x64\\Rscript.exe'
    subprocess.check_call( [r_path, 'fmr.R'] )
    print("Stage1 completed")
    print("**************")
    print("")

def stage2():
    " Create skeleton report in Word "
    print("**************")
    print("Running stage2")
    path = os.getcwd()
    word = win32com.client.Dispatch('Word.Application')
    doc = word.Documents.Add()
    doc.Range().InsertAfter('Field metabolic rate analysis run on ')
    doc.Range().InsertAfter(datetime.date.today())
    doc.Shapes.AddPicture(os.path.join(path, 'fmr_plot.png'), 0,1,30,60)
    # 17 is a magic number meaning 'PDF format'
    doc.ExportAsFixedFormat(os.path.join(path, 'report.pdf'), 17)
    doc.Close(0)
    print("Stage2 completed")
    print("**************")

stage1()
stage2()
