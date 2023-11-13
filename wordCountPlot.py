import matplotlib.pyplot as plt
import matplotlib.dates as mdate
import numpy as np

# Aliasing for convenience
def dstr(datestring):
    return mdate.datestr2num(datestring)

xlow = '2022/11/01'
xupp = '2023/12/01'
# Read data and convert dates
# (append 0-point for line coming off the edge of the graph)
date, count = np.loadtxt('wordCountHistory').transpose()
count = np.insert(count, 0, -10 )
date = mdate.epoch2num(date)
date = np.insert(date, 0, mdate.datestr2num(xlow) )
# Figure & axes size
fig = plt.figure(figsize=(8,6))
ax = plt.axes([0.14, 0.12, 0.80, 0.81])
# Plotting and limits
ax.plot_date(date, count, 'r-')
ax.set_xlim(mdate.datestr2num([xlow, xupp]))
ax.set_ylim(bottom=0)
ax.set_ylabel('Approximate word count', y=1.0, ha='right',labelpad=10)
# Format x-axis ticks and labels
fig.autofmt_xdate(ha='center')
ax.xaxis.set_major_formatter( mdate.DateFormatter("%b '%y") )
months = mdate.MonthLocator()
ax.xaxis.set_major_locator(months)
ax.xaxis.set_minor_locator(months)
# > shift major ticks by half interval
ticks,_ = plt.xticks()
plt.xticks(ticks=[ .5*(a+b) for a, b in zip(ticks[:-1], ticks[1:]) ])
# Tick sizing
ax.tick_params(axis='x',which='minor',size=6)
ax.tick_params(axis='x',which='major',size=0)
ax.tick_params(axis='y',which='major',size=6)
ax.tick_params(axis='y',which='minor',size=3)
# Annotations [MANUALLY ADDED]
#ax.annotate(\
#    'Added chapter headings',\
#    xy=(dstr('2022/11/20 12:00'), 50), xycoords='data',\
#    xytext=(-10,30), textcoords='offset points',\
#    arrowprops={'arrowstyle':"->"},\
#    size=12,\
#    ha='center'
#)
#ax.annotate(\
#    'Copied eratio section from MCA',\
#    xy=(dstr('2023/01/19'), 2500), xycoords='data',\
#    xytext=(-130,0), textcoords='offset points',\
#    arrowprops={'arrowstyle':"->"},\
#    size=12,\
#    ha='center', va='center'
#)
# Save figure
plt.savefig('word_count.pdf')
plt.savefig('word_count.png', dpi=1200)
