
import logging
import os
from telegram import __version__ as TG_VER
import cx_Oracle
import pandas as pd
import xlsxwriter

try:
    from telegram import __version_info__
except ImportError:
    __version_info__ = (0, 0, 0, 0, 0)  # type: ignore[assignment]
if __version_info__ < (20, 0, 0, "alpha", 1):
    raise RuntimeError(
        f"This example is not compatible with your current PTB version {TG_VER}. To view the "
        f"{TG_VER} version of this example, "
        f"visit https://docs.python-telegram-bot.org/en/v{TG_VER}/examples.html"
    )

from telegram import Update
from telegram.ext import Application, CommandHandler, ContextTypes

# Enable logging

logging.basicConfig(
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s", level=logging.INFO
)



# Define a few command handlers. These usually take the two arguments update and

# context.

# Best practice would be to replace context with an underscore,

# since context is an unused local variable.

# This being an example and not having context present confusing beginners,

# we decided to have it present as context.

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """Star t edek nume kime ."""
    #await update.message.reply_text("Salam! Baslamaq ucun bu komandani yaz /set senede fayllar gelsin")
    chat_id = -1001503811110
    #update.effective_message.chat_id
    print(chat_id)
    try:
        # args[0] should contain the time for the timer in seconds

        due = 5# istifadeci her biri ucun ayri 
        #print(due)
        '''if due < 10:
            await update.effective_message.reply_text("Qabaga getmek olmaz !")
            return'''

        
        context.job_queue.run_repeating(alarm, interval=10800, chat_id=chat_id, name=str(chat_id), data=due)
        text = "Interval her 5 san helelik !"

       
    except (IndexError, ValueError):
        await update.effective_message.reply_text("hardasa sehv etdin bele yazmaq lazimdir: /set 'reqem' ")




async def alarm(context: ContextTypes.DEFAULT_TYPE) -> None:
    """Esas job file gonderen """
    job = context.job
    host="172.10.20.11"
    port="1521"
    sid='pdbbokt'
    user='smart'
    password='oracledb'
    sid = cx_Oracle.makedsn(host, port, service_name=sid)

    connection = cx_Oracle.connect(user, password, sid, encoding="UTF-8")
    data = pd.read_sql('SELECT * FROM ecxel_python', connection)
    data.to_excel('D:/rr.xlsx')  #called before closing the connection
    connection.close()
    if os.path.exists("D:/rr.xlsx"):
        await context.bot.send_document(job.chat_id,document=open('D:/rr.xlsx', 'rb')) 
    else:   
        
        #c = conn.cursor()
        #c.execute('select * from user$') # use triple quotes if you want to spread your query across multiple lines
        #for row in c:
        #    print (row[0], '-', row[1]) # this only shows the first two columns. To add an additional column you'll need to add , '-', row[2], etc.
#conn.close()   
        await context.bot.send_message(job.chat_id, text="Fayl hazir deyil novbeti defe yoxlanilacaq")
    #os.remove("D:/rr.xlsx")
   # text=f"Beep! {job.data} seconds are over!")
    #bot.send_document(chat_id=chat_id, )





async def set_timer(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """que elave """

    chat_id = update.effective_message.chat_id
    try:
        # args[0] should contain the time for the timer in seconds

        due = float(context.args[0])# istifadeci her biri ucun ayri 
        #print(due)
        if due < 0:
            await update.effective_message.reply_text("Qabaga getmek olmaz !")
            return


        context.job_queue.run_repeating(alarm, interval=due, chat_id=chat_id, name=str(chat_id), data=due)
        text = "Interval her 5 san helelik !"

       
    except (IndexError, ValueError):
        await update.effective_message.reply_text("hardasa sehv etdin bele yazmaq lazimdir: /set 'reqem' ")



async def unset(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """Job sil."""
    chat_id = update.message.chat_id
    job_removed = remove_job_if_exists(str(chat_id), context)
    text = "job  legv edildi!" if job_removed else "aktiv hec ne yoxdur."
    await update.message.reply_text(text)



def main() -> None:
    """Run bot."""
    # Create the Application and pass it your bot's token.
    application = Application.builder().token("5547473364:AAHoh0kyv_UrbES5BVQuoJ0WQfh6pI-D4u8").build()
    # on different commands - answer in Telegram
    application.add_handler(CommandHandler(["start", "help"], start))
    application.add_handler(CommandHandler("set", set_timer))
    application.add_handler(CommandHandler("unset", unset))
    # Run the bot until the user presses Ctrl-C
    application.run_polling()

if __name__ == "__main__":
    main()