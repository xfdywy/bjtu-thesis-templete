# 北京交通大学博士毕业论文latex模版

###################################
# 2021年1月3日最新更新，更新了奇偶页页眉页脚区别，更新了自动空白页， 更新了奇偶页页边距区别（根据学校要求，考虑到装订的时候，奇偶页左右边距应该不同）。
#################################

- 使用texlive2019  xelatex编译
- 基本满足学术硕士博士格式要求
- 有基本使用示例
- 参考
    - https://github.com/xiaoleeza/bjtu-thesis
    - https://github.com/Jamiesona/bjtu-thesis

- 推荐安装最新版texlive ， 官网为：

> https://www.tug.org/texlive/

- 如果下载速度太慢，可以用清华的开源镜像
> https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/

- 安装后，使用xelatex编译，不可以使用pdflatex。

- 推荐和默认的中文编码为ut8.
- 推荐使用texstudio 作为编辑器，配合texlive使用。
- 有任何问题欢迎提issue

！！！！！！！
记得主文件是demo.tex，打开demo.tex，然后编译，别编译那个.cls模版文件，会报错。。。。
！！！！！！！


## docker编译（可以尝试，不是必须） 
如果知道我说的是啥可以往下看，不然可以算了。

有兴趣的同学可以尝试用docker来编译tex文件，linux上xelatex的速度比windows上快很多， 而且不用安装和配latex编译器的环境了比如texlive啥的。

 

 win10 上的docker有hyper-v支持，性能也是杠杠的， 安装一个docker for win10， 启动之后用这条命令就可以啦

``` cmd
docker run -i --rm -w /data -v "%cd%:/data" tianon/latex xelatex  -synctex=1 -interaction=nonstopmode  RL.tex
```

解释一下  

- `tianon/latex`是某大佬的docker，里面有了新的textlive。对应的dockerfile 在这里
> https://github.com/tianon/dockerfiles/blob/master/latex/Dockerfile
- i 保持交互
- --rm 表示运行完就把这个docker container删掉
- -w 表示后面执行的命令在docker中的工作路径
- -v 是文件夹映射，%cd% 表示当前文件夹
- ‘xelatex  -synctex=1 -interaction=nonstopmode  RL.tex’ 这一段就是在docker container里面执行的命令啦，应该很容易看懂，在调用xelatex 去编译 RL.tex


懒得麻烦的话，可以用我写好的bat文件，直接在windows上的cmd里面执行  `xelatex.bat RL.tex` 就ok了


速度100页的论文能快10多秒，从接近30秒，变成了18秒。

当然问题在于正向反向跳转的时候会出问题。。。。原因出在编译的时候生成的synctex文件里面记录的文件路径是docker里面的路径，因此在我们这个例子里面就是/data， 所以在windows上没法进行跳转。如果有大佬会操作，请一定告诉我。

现在有一个邪门的办法。如果你用vscode，你可以用`synctex.bat`作为你synctex的应用程序，vscode支持自定义。这个时候就可以跳转了，虽然效率上稍微有所折扣，看起来应该是run一个docker，然后在docker里面synctex，之后再怎么把信号传回来（我不懂，瞎说的，反正能用）


当然了，你如果你本来就是linux系统，想用docker，也完全ok，你把我bat文件改成shell的语法就行，没啥区别，主要是%cd%这里改成 ”\$(pwd)“ 就行。


docker 也可以用我push到阿里云的镜像，  直接pull这个也行
就是把tianon/latex 换成下面这个

> registry.cn-hangzhou.aliyuncs.com/yuewang/xfdywy:latex


.
