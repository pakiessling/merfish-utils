import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
############################################################################################

RAW_DIRECTORY = "Z:\merfish_raw_data"
RAW_FINISHED_FILE = "EXPERIMENT_FINISHED"
PROCESSED_FINISHED_FILE = "MERLIN_FINISHED"


############################################################################################
class Watcher:

    def __init__(self, directory=RAW_DIRECTORY, handler=FileSystemEventHandler()):
        self.observer = Observer()
        self.handler = handler
        self.directory = directory

    def run(self):
        self.observer.schedule(
            self.handler, self.directory, recursive=True)
        self.observer.start()
        print("\nWatcher Running in {}/\n".format(self.directory))
        try:
            while True:
                time.sleep(1)
        except:
            self.observer.stop()
        self.observer.join()
        print("\nWatcher Terminated\n")


class Handler(FileSystemEventHandler):
    @staticmethod
    def on_any_event(event):
        if event.is_directory:
            return None

        elif event.event_type == 'created':
            if event.src_path.count("\\") == 2:
                if event.src_path.endswith(RAW_FINISHED_FILE):
                    print("Run complete!")
                    # Send Slack message, upload folder ect
                if event.src_path.endswith(PROCESSED_FINISHED_FILE):
                    print("Analysis complete!")
                    # Send Slack message, upload folder ect

if __name__=="__main__":
    w = Watcher(RAW_DIRECTORY, Handler())
    w.run()
