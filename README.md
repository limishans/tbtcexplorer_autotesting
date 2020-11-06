## tbtcexplorer_autotesting

Any released product before its release must pass a series of tests: load, acceptance, functional, system, modular, etc.  
Robot Framework (RF, link) is a versatile open source system for acceptance testing and robotic work.  
This is exactly acceptance testing - testing carried out at the stage of delivery of a finished product or part of a product. Acceptance testing goals are to test the business logic of your product, or part of a product. RF is based on the keyword-driven test format.  
### **Advantages of using the Robot Framework** 
Keyword Driven Testing (KDT) approach: having keywords available, test development can be done by a QA specialist with no or minimal programming skills.  
*	Variety of internal libraries: for RF there are over 40 different libraries, if the functionality from the ready-made libraries is not enough, then you can use external library (link)or  implement and connect your own library.
* Own development environment RIDE (GUi). In addition, if necessary, it is possible to use plugins to work in the IDE and some text editors. Tests are plain-text format.
* Convenient and detailed logs with test results: from them you can get a lot of information in case of problems with tests.


## RF Installation:
1.	Install Python
2.	pip install robotframework
3.	Add paths to the PATH environment variable:   
  * %LocalAppData%\Programs\Python\Python37\Scripts\
  * %LocalAppData%\Programs\Python\Python37\
4.	pip install robotframework-ride



In general, RF is a tool that can be imposed on top of any testing system and, thanks to the modules, it can interact with them, performing high-level testing.  
In order for the RF to be able to pull its requests in the desired sequence, some test data is needed. To do this, i developed a project consisting of several Robot Framework tests and connected different libraries to them.  
Target system for testing: https://tbtcexplorer.com/

### The autotest consists of two parts:
* testing the connection and the response received from the server
* testing some web forms on the site for the correctness of their work

For Web forms testing you can use SeleniumLibrary. And for its workability you should install webdriver for the appropriate internet browser on your PC.  
Webdriver installation: https://github.com/rasjani/webdrivermanager  
For Example, Google Chrome driver you can download here: https://sites.google.com/a/chromium.org/chromedriver/downloads    
Save the exe-file chromedriver.exe (you do not need to install it - it is not an installation file)  on your computer and write in the PATH environment variable the path to the directory in which it is saved.  
After that reboot your PC and start RIDE using console command: ride.py. If Python is correctly installed (you can check this “python --version”) and Environment variables are registered this command will launch RIDE  


Thus, any application, website, product that enter the market must first of all be tested for possible errors in the code, execution logic, business logic and other things necessary for the effective and efficient operation of the released tool.  
Moreover, automated testing allows you to save time at times and in one launch check a huge number of options for using the application under test, passing various parameters to it as input and receiving the expected values after completion
