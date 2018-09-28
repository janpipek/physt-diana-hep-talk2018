---
title: physt
revealOptions:
    transition: 'fade'
    controls: false
    progress: true

---

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous"/>
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Palanquin" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"> 

<!-- .slide: data-background="background.png" -->

# physt <img src="physt-logo.svg" style="height: 100%; position: relative; top: .3em;"/>

<div style="height: 1em"></div>

### DIANA meeting, <span style="font-size: 80%; opacity:0.5">1<sup style="font-size: 60%">st</sup> October 2018</span>

##### Jan Pipek, <span style="font-size: 80%; text-transform: none; opacity:0.5">Showmax</span>
---

## Background

<div style="height: 1em"></div>

<div style="font-size: 80%;">

<li><span style="opacity:0.8">2001-2007:</span> masters in physics (HEP)

<li>2007-2015: Ph.D. in medical physics (Geant4)

<li>2015-2017: post-doc in mdical physics (Geant4)

<li>2017-: data scientist @ Showmax, Prague

</div>

---

### Motivation

<div style="height: .5em"></div>

```python
import numpy as np
histogram = np.histogram(heights)
```

<div class="fragment output">

<div style="height: .5em"></div>

```python
(array([  4,  22,  96, 228, 272,          # Frequencies
        226, 104,  38,   9,   1]),


 array([132.1841, 141.0516, 149.9191,     # Edges
        158.7866, 167.6541, 176.5216,
        185.3891, 194.2566, 203.1241,
        211.9916, 220.8591])
```
</div>

<div style="height: .5em"></div>

<p class="fragment"><i class="fas fa-frown"></i> Tuple of arrays?</p>

Note: Well, I think
that the way histograms are not treated with enough respect in the standard scientific stack.
Physt is based on this. Now let me show you what I mean by respect. And let me show you
how physt shows this respect...  Joke about class problems

---

### matplotlib.pyplot.hist

```
import matplotlib.pyplot as plt
histogram = plt.hist(heights)
```

<img src="images/matplotlib.svg" class="fragment" style="height: 8em;"/>

---

### matplotlib.pyplot.hist

```
import matplotlib.pyplot as plt
histogram = plt.hist(heights)
```


<div class="fragment output">
<div style="height: .5em"></div>

```
(array([  4.,  22.,  96., 228., 272., 
        226., 104.,  38.,   9.,   1.]),

 array([132.1841, ..., 220.8591]),
 <a list of 10 Patch objects>)
 ```
</div>

<div style="height: .5em"></div>

<p class="fragment"><i class="fas fa-frown-open"></i> Tuple of three arrays!</p>

---

<h2><span class="red">Histograms deserve more!</span></h2>

---

## Histograms

* should be represented as objects

* should have nice bin edges

* should be dynamic

* should be easy to plot

---

<!-- .slide: data-background="background.png" -->

# physt <img src="physt-logo.svg" style="vertical-align: middle; zoom:1.2">

<div style="height: .5em"></div>



---

## physt

<div style="height: .5em"></div>

<p class="fragment">⁕ March 2016<span style="width:4em;display:inline-block"> </span><span class="fragment">† not yet</span></p>

<div style="height: .5em"></div>

<p class="fragment"><img src="images/rootlogo.gif" style="max-height: 2em;vertical-align:middle"/><img src="images/numpylogo.jpeg" style="margin:1em;max-height: 2em;vertical-align:middle"/> <img src="images/matplotliblogo.svg" style="max-height: 1.5em;vertical-align:middle"/></p>

---

<div><i class="fab fa-github"></i> [https://github.com/janpipek/physt](https://github.com/janpipek/physt)</div>

<img src="images/qr.png" style="width:30%"/>

<div style="font-size:180%;">

<pre style="width:60%; text-align:center"><code>pip install physt
</code></pre>

</div>

---

<!-- .slide: data-background="#f7f7d8"  -->

<h2 class="toc-active">1) Object representation</h2>

<p class="toc-future">2) Nice bins</p>

<p class="toc-future">3) Read-only?</p>

<p class="toc-future">4) Easy plottin'</p>

</div>

---

## physt.h1

<div style="height: .5em"></div>

```
from physt import h1
h1(data)
```

<div class="fragment output" style="font-size: 110%">
<div style="height: .5em"></div>

```
Histogram1D(bins=(10,), total=1000, dtype=int64)
```
</div>


<div style="height: .5em"></div>

<p class="fragment green"><i class="fas fa-smile-beam"></i> Class!</p>

Note: Wow, it's a class

---

```
histogram.frequencies
```

<div class="fragment output">
<div style="height: .5em"></div>

```
array([  4,  22,  96, 228, 272, 226,
       104,  38,   9,   1])
```
</div>

---

```
histogram.bins
```

<div class="fragment output">
<div style="height: .2em"></div>

```
array([[-3.24126734, -2.53186746],
       [-2.53186746, -1.82246757],
       [-1.82246757, -1.11306769],
       [-1.11306769, -0.40366781],
       ...
       [ 1.72453184,  2.43393172],
       [ 2.43393172,  3.14333161],
       [ 3.14333161,  3.85273149]])
```

</div>

---


```
histogram.numpy_bins
```


<div class="fragment output">
<div style="height: .2em"></div>

```
array([-3.24126734, -2.53186746, -1.82246757, 
       -1.11306769, -0.40366781,  0.30573208,
        1.01513196,  1.72453184,  2.43393172,
        3.14333161,  3.85273149])
```

</div>

---

### Meta data

```python
histogram.name = "Heights"
histogram.title = "How tall are people in Fakeland?"
histogram.axis_name = "Height [cm]"   
```

<div class="fragment output">
<div style="height: .2em"></div>

```python
Histogram1D('Heights', bins=(10,), total=1000, dtype=int64)

# histogram.meta_data
{
    'name': 'Heights',
    'axis_names': ('Height [cm]',),
    'title': 'How tall are people in Fakeland?'
}
```

</div>

---

<div class="output">
<div></div>


```python
{
    'name': 'Heights',
    'axis_names': ('Height [cm]',),
    'title': 'How tall are people in Fakeland?'
}
```

</div>

![Bar chart](images/repre-meta.svg) 

---

### Serialization

```
histogram.to_json("histogram.json", indent=2)
```

<div class="fragment output" style="font-size: 77%">
<div style="height: .2em"></div>

```json
{
  "histogram_type": "Histogram1D",
  "binnings": [
    {
      "binning_type": "NumpyBinning",
      "numpy_bins": [
        -3.2412673400690726, ...,  -1.822467573924314,
      ]
    }
  ],
  "frequencies": [ 4, 22, 96, 228, 272, 226, 104, 38, 9, 1 ],
  "dtype": "int64",
  ...
  "physt_compatible": "0.3.20"
}
 ```

 </div>

---

### Mathematical entities?

Note: You know that underneath, there is a numpy array

---

<img src="images/add1.svg" class="operand"/> + <img src="images/add2.svg" class="operand"/> = ?

---

```
histogram_total = histogram1 + histogram2
```

<div><img src="images/add1.svg" class="operand"/> + <img src="images/add2.svg" class="operand"/> = <img src="images/add.svg" class="operand"/></div>

---

<div><img src="images/add1.svg" class="operand"/> * <img src="images/add2.svg" class="operand"/> = ?</div>

---

```
histogram_total = histogram1 * histogram2
```

<div class="fragment">
    <div style="height: .5em"></div>

```error
RuntimeError:
    Histograms may be multiplied only by a constant.
```
</div>

---

### Supported operators

* addition (same or similar bins)

* subtraction (with warning)

* multiplication & division (by scalar)

---

### Transformations

* normalization (total = 1)

* densities (scaled by bin width)

* cumulative frequencies (~CDF)

---

## Multiple dimensions

---

```python
heights = np.random.normal(172.7, 12.5, size=1000)

weights = (heights - 100 +
    np.random.normal(0, 12.5, size=1000))

iqs = np.random.normal(100, 15, 1000)
```

<div>
<img src="images/nd-height.svg" style="max-width:25%"/>
<img src="images/nd-weight.svg" style="max-width:25%"/>
<img src="images/nd-iq.svg" style="max-width:25%"/>
</div>

---

### h2()

```python
h2(heights, weights, axis_names=["height", "weight"])
```

<div class="fragment output">
<div style="height: .2em"></div>

```
Histogram2D(bins=(10, 10), total=1000, dtype=int64)
```

</div>

---

#### 2D heatmap

<img src="images/nd-2d.svg"/>

---

### h3()

```python
df = pd.DataFrame({
    "height": heights,
    "weight": weights,
    "iq": iqs
})
H3 = h3(df)    #  From pandas DataFrame
```

<div class="fragment output">
<div style="height: .2em"></div>

```
HistogramND(bins=(10, 10, 10), total=1000, dtype=int64)
```

</div>


<div style="height: .5em"></div>

<p class="fragment"><i class="fas fa-frown-open"></i> No visualization*</p>

---

### h()

As many dimensions as you want 

<div style="height: .5em"></div>

<p class="fragment"><i class="fas fa-exclamation-triangle"></i> and have memory for</p>

---

### Projections

into lower dimensions

---

```
H3.projection("height", "weight")
```

<div class="fragment output">
<div style="height: .2em"></div>

```
Histogram2D(bins=(10, 10), total=1000, dtype=int64)
```

</div>

<img class="fragment" src="images/nd-2d.svg"/>

---

### Indexing

almost like numpy

---

```python
H3[2]
```

<div class="fragment output">
<div style="height: .2em"></div>

```
Histogram2D(bins=(10, 10), total=96, dtype=int64)
```

</div>

<img class="fragment" src="images/nd-index0.svg"/>

---

```python
H3[4, 5]
```

<div class="fragment output">
<div style="height: .2em"></div>

```
Histogram1D(bins=(10,), total=49, dtype=int64)
```

</div>

<img class="fragment" src="images/nd-index1.svg"/>

---

```python
H3[2:5, :, 4:6]
```

<div class="fragment output">
<div style="height: .2em"></div>

```
HistogramND(bins=(3, 10, 2), total=281, dtype=int64)
```

</div>

---

```python
H3[4, 5, 6]
```

<div class="fragment output">
<div style="height: .2em"></div>

```
  (
    (167.6541, 176.5216), # Bin in "height"
    (82.7018, 94.7072),   # Bin in "weight"
    (117.2190, 127.6376)  # Bin in "iq"
  ),
  5                       # Frequency
```

</div>


---

<!-- .slide: data-background="#f7f7d8"  -->

<p class="toc-past">1) Object representation</p>

<h2 class="toc-active">2) Nice bins, <span style="color: red">please!</span></h2>

<p class="toc-future">3) Read-only?</p>

<p class="toc-future">4) Easy plottin'</p>

---

```python
h1(heights)                          # Let numpy decide
```

![Real histogram](images/bins-raw.svg) 

---

<img style="max-width: 40%" src="images/bins-raw.svg"/>

```python
histogram.binning
```

<div class="fragment output">
<div style="height: 0em"></div>

```
NumpyBinning(
    array([132.1841, 141.0516, 149.9191, ...
           203.1241, 211.9916, 220.8591])
)
```

</div>

---

```python
h1(heights, "fixed_width", 2.5)      # 2.5 cm each bin
```

![Real histogram](images/bins-fixed.svg) 

<div class="fragment output">
<div style="height: 0em"></div>

```python
FixedWidthBinning(bin_width=2.5, bin_count=37, min=130.0)
```

</div>

---

```python
h1(heights, "human", 15)     # => 19 bins, 5 cm each
```

![Real histogram](images/bins-human1.svg) 


<div class="fragment output">
<div style="height: 0em"></div>

```python
FixedWidthBinning(bin_width=5.0, bin_count=19, min=130.0)
```

</div>

---

```python
h1(heights, "human")         # => 10 bins, 10 cm each
```

![Real histogram](images/bins-human2.svg) 

<div class="fragment output">
<div style="height: 0em"></div>

```python
FixedWidthBinning(bin_width=5.0, bin_count=10, min=130.0)
```

</div>

---

```python
h1(children)
```

![Real histogram](images/bins-int0.svg) 

---


```python
h1(children, "integer")
```

![Real histogram](images/bins-int1.svg) 

<div class="fragment output">
<div style="height: 0em"></div>

```python
FixedWidthBinning(bin_width=1.0, bin_count=7, min=-0.5)
```

</div>

---

### Huge range

<table border="1" class="dataframe" style="font-size: 80%">
  <thead>
    <tr style="text-align: right;">
      <th>Country</th>
      <th>Population</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>...</td>
      <td>...</td>
    </tr>    
    <tr>
      <td>Malaysia</td>
      <td>31,187,265</td>
    </tr>
    <tr>
      <td>Maldives</td>
      <td>427,756</td>
    </tr>
    <tr>
      <td>Mali</td>
      <td>17,994,837</td>
    </tr>
    <tr>
      <td>Malta</td>
      <td>437,418</td>
    </tr>
    <tr>
      <td>...</td>
      <td>...</td>
    </tr>    
  </tbody>
</table>

---

```python
h1(population)
```

![Real histogram](images/bins-nonexpo.svg) 

<div class="fragment output">
<div style="height: 0em"></div>

```
NumpyBinning(array([1.1097e+04, 1.3787+08, ..., 1.3786+09]))
```

</div>

---

```python
h1(population, "exponential")
```

![Real histogram](images/bins-expo1.svg) 

<div class="fragment output">
<div style="height: 0em"></div>

```
ExponentialBinning(array([1.109e+04, 4.085e+04, ..., 1.378e+09]))
```

</div>

---

```python
h1(population, "exponential", 12, range=(10000, 1e10))
```

![Real histogram](images/bins-expo3.svg) 


<div class="fragment output">
<div style="height: 0em"></div>

```
ExponentialBinning(array([1.000e+04, 3.162e+04, ..., 1.000e+10]))
```

</div>

---

<!-- .slide: data-background="#f7f7d8"  -->

<p class="toc-past">1) Object representation</p>

<p class="toc-past">2) Nice bins</p>

<h2 class="toc-active">3) Read-only? <span class="fragment" style="color: red">No.</span></h2>

<p class="toc-future">4) Easy plottin’</p>

Note: tuple of arrays... What?

---

```python
histogram = h1(heights, "fixed_width", 5)
```

![Sum of hists](images/dynamic0.svg) 

---

<i class="fas fa-walking" style="vertical-align: middle; font-size: 200%; margin-right: .2em; color: darkorange"></i> I move to Fakeland...

---

```python
histogram << 190
```

![Sum of hists](images/dynamic1.svg) 

---

A group of 200 basketball players moves in...

---

```python
newcomers = np.random.normal(220, 15, 200)
histogram.fill_n(newcomers)
```

![Sum of hists](images/dynamic2.svg) 

---


```python
histogram.adaptive = True   
# or histogram = h1(heights, "fixed_width", 5, adaptive=True)
histogram.fill_n(newcomers)
```

![Sum of hists](images/dynamic3.svg) 

---

```python
histogram1 = h1(heights, "fixed_width", 5, adaptive=True)   
histogram2 = h1(newcomers, "fixed_width", 5, adaptive=True)
histogram + histogram2
```

![Sum of hists](images/dynamic3.svg) 

---


<!-- .slide: data-background="#f7f7d8"  -->

<p class="toc-past">1) Object representation</p>

<p class="toc-past">2) Nice bins</p>

<p class="toc-past">3) Read-only?</span></p>

<h2 class="toc-active">4) Easy plottin’</h2>

<p class="fragment red">not tied to a specific plotting library!</p>

---

## Plotting backends

* matplotlib

* vega*

* plotly*

* folium (for geo data)

<p class="fragment" style="color: green">...add yours!</p>

---

```python
histogram.plot.bar()
```

![Sum of hists](images/bar.svg) 


---

```python
histogram.plot.step()
```

![Sum of hists](images/step.svg) 

---

```python
histogram.plot.scatter()
```

![Sum of hists](images/scatter.svg) 

---

```python
histogram.plot.line()
```

![Sum of hists](images/line.svg) 

---

```python
H.plot(show_values=True)
```

![Sum of hists](images/bar1.svg) 

---

```python
H.plot(show_values=True, color="#c0ffc0")
```

![Sum of hists](images/bar2.svg) 

---

```python
H.plot(show_values=True, color="#c0ffc0", lw=1)
```

![Sum of hists](images/bar3.svg) 

---

```python
H.plot(color="#c0ffc0", lw=1, errors=True)
```

![Sum of hists](images/bar-err.svg) 

---

```python
H.plot(color="#c0ffc0", lw=1, errors=True, show_stats=True)
```

![Sum of hists](images/bar-stats.svg) 


---

```python
histogram2.plot()
```

![Sum of hists](images/map.svg) 

---

```python
histogram2.plot(lw=0)
```

![Sum of hists](images/map-lw0.svg) 

---

```python
histogram2.plot(lw=0, show_values=True)
```

![Sum of hists](images/map-lw0-values.svg) 

---

```python
histogram2.plot(lw=0, show_values=True, cmap="rainbow")
```

![Sum of hists](images/map-0-rainbow.svg) 

---

```python
histogram2.plot(lw=0, ..., show_zeros=False)
```

![Sum of hists](images/map-rainbow.svg) 

---

```python
histogram2.plot(lw=0, ..., cmap_normalize="log")
```

![Sum of hists](images/map-rainbow-log.svg) 

---

### Real-World Examples

---

#### Temperature during the day

<img src="images/temperatures.svg" style="max-width:80%"/>

<div class="source">Source: BrnoHacks 2017</div>

---

#### Fluence of neutrons

<img src="images/fluence.png" style="width:63%"/>

<div class="source">Source: ELIMED project</div>

---

#### Prague International Marathon

<img src="images/marathon.svg" style="width:70%">

<div class="source">Source: RunCzech</div>

---

#### Prague International Marathon

<img src="images/marathon-detail.svg" style="width:70%">

<div class="source">Source: RunCzech</div>

---

# Histograms

<ul style="list-style:none">
<li class="fragment"><p><i class="green fas fa-check fa-li"></i>can be represented as objects</p></li>

<li class="fragment"><p><i class="green fas fa-check fa-li"></i>can have nice bin edges</p></li>

<li class="fragment"><p><i class="green fas fa-check fa-li"></i>can be dynamic</p></li>

<li class="fragment"><p><i class="green fas fa-check fa-li"></i>can be easy to plot</p></li>
</ul>

---

### '\U0001f4ca'


<div class="fragment" style="font-size:150px">📊</div>

<div style="height:1em"></div>

<h4 class="fragment"><i class="red fas fa-times-circle"></i> Bar chart!</h4>

---

<!-- .slide: data-background="background.png" -->

<div>
  <div style="display:inline-block;width:40%;margin-right:10px;vertical-align:middle">
    <img src="images/qr-talk.png" style="width:100%"/>
  </div>
  <div style="display:inline-block;width:55%;vertical-align:middle">
    <div><i class="fab fa-github"></i> [janpipek/physt](https://github.com/janpipek/physt])</div>
    <div style="font-size:80%"><i class="fab fa-github"></i> [janpipek/pydata2018-berlin](https://github.com/janpipek/pydata2018-berlin])</div>
    <div style="height:0.5em;"></div>
    <div><i class="fas fa-envelope"></i> jan.pipek@gmail.com</div>
    <div style="height:1.0em;"></div>
    <div><img style="height:2em;" src="images/showmax-logo.png"/></div>
    <div style="font-size: 55%">Open positions in Prague</div>
  </div>
<div>






