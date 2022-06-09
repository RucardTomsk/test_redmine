import datetime
import zipfile
import os
import schedule

class BackupUtils:

    def __init__(self):
        self.__current_date = str(datetime.datetime.now().strftime('%d_%m_%Y'))

    def to_zip(self, file, append_to_file=False):
        print('+')
        filename='backup/'+self.__current_date + '.zip'
        param_zip = 'a' if append_to_file else 'w'
        try:
            with zipfile.ZipFile(filename, param_zip) as zip_file:
                if os.path.isfile(file):
                    zip_file.write(file)
                else:
                    self.add_folder_to_zip(zip_file, file)
            return True
        except IOError as error:
            print('Cannot create zip file, error: {}'.format(error))
            return False

    def add_folder_to_zip(self, zip_file, folder):

        for file in os.listdir(folder):
            full_path = os.path.join(folder, file)
            if os.path.isfile(full_path):
                zip_file.write(full_path)
            elif os.path.isdir(full_path):
                self.add_folder_to_zip(zip_file, full_path)

    def remove_old_files(self):
        current_date = self.__current_date.split('_')
        for backup in os.listdir('backup'):
            day, month, year = backup.split('_')
            if int(current_date[1]) > int(month):
                if int(current_date[0]) > 3:
                    os.remove('backup/'+backup)
                else:
                    continue
            else:
                if int(current_date[0])-int(day) > 3:
                    os.remove('backup/'+backup)
                else:
                    continue


def run_backup():
    backup_utils = BackupUtils()
    backup_utils.to_zip("mysql")
    backup_utils.remove_old_files()

def main():
    schedule.every().day.at('10:00').do(run_backup)

    while True:
        schedule.run_pending()

if __name__ == '__main__':
    main()


