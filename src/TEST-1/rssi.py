import matplotlib.pyplot as plt
import numpy as np


def decode_rssi_byte(file_name):
    rssi_list = np.array([])
    for line in file_name:
        ind = line.find('\\x')
        if ind != -1:
            rssi_list = np.insert(rssi_list, len(
                rssi_list), int(line[-4:-2], base=16))
    plt.hist(rssi_list)
    # plt.show()
    plt.savefig(file_name.name+".jpg")
    plt.clf()


t1_file = open("./t1.txt")
decode_rssi_byte(t1_file)
t1_file.close()


t1_file = open("./t2.txt")
decode_rssi_byte(t1_file)
t1_file.close()

t1_file = open("./rssi-org.txt")

decode_rssi_byte(t1_file)
t1_file.close()
