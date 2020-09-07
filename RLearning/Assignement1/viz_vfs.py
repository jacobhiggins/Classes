import numpy as np
import matplotlib.pyplot as plt
import pickle
import seaborn as sns
import imageio

board_dim = (4,4)

pi_vfs = pickle.load(open("pi_vfs.p","rb"))
vi_vfs = pickle.load(open("vi_vfs.p","rb"))

pi_rs, cs = pi_vfs.shape
vi_rs, cs = vi_vfs.shape

images = []

for i in range(pi_rs):
    pi_vf = pi_vfs[i,:]
    pi_vf = pi_vf.reshape(board_dim)
    pi_vf[3,3] = 1.0
    ax = sns.heatmap(pi_vf,annot=False)
    plt.title("PI Value Function on Slippery Lake, Iteration: " + str(i+1))
    fig = plt.gcf()
    fig.canvas.draw()
    image = np.frombuffer(fig.canvas.tostring_rgb(),dtype='uint8')
    image  = image.reshape(fig.canvas.get_width_height()[::-1] + (3,))
    # image = image.reshape
    images.append(image)
    plt.close()

imageio.mimsave("./pi_vfs.gif",images,fps=1)

images = []

for i in range(vi_rs):
    vi_vf = vi_vfs[i,:]
    vi_vf = vi_vf.reshape(board_dim)
    vi_vf[3,3] = 1.0
    ax = sns.heatmap(vi_vf,annot=False)
    plt.title("VI Value Function on Slippery Lake, Iteration: " + str(i+1))
    fig = plt.gcf()
    fig.canvas.draw()
    image = np.frombuffer(fig.canvas.tostring_rgb(),dtype='uint8')
    image  = image.reshape(fig.canvas.get_width_height()[::-1] + (3,))
    # image = image.reshape
    images.append(image)
    plt.close()

imageio.mimsave("./vi_vfs.gif",images,fps=1)

# ax = sns.heatmap(pi_vf)
# plt.show()