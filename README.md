# Musarithmica: The Sound of Universal Computation
The title of the project is a tribute to the great master <a href="https://en.wikipedia.org/wiki/Athanasius_Kircher">Athanasius Kircher</a> who in a sense preceded Babbage to a limited extend with his 
<a href="https://en.wikipedia.org/wiki/Arca_Musarithmica">Arca Musarithmica</a> algorithm. The 'musarithmica' code for the<br> transcription of a automaton in to a single signal is a future project requiring special fitler design. It's an attempt in<br> generalizing some previous technique used in CAdynamics. Motivation behind this project is explained in the technical notes.<br> 
At the moment what is offered includes the following:

ZellenKlavier ("Cellular" Piano): A lonely CA singing the Cyclic Tag Blues. The name choice was a tribute to the other, rather<br> (in)famous <a href="https://en.wikipedia.org/wiki/Cat_organ">invention</a> by Kircher.
Try it with rule 110 to get the feeling of Turing completeness<br>

powerset: example code of a polyphonic auto-composer based on isentropic encodings of sets of bit strings.

partitions: Similar with powerset for the case of integer partitions of which coefficients admit an isospectral encoding.

The variety of parameters in the above allows great flexibility in the audible results.

<b>Technical Notes</b>

This is a project about a proof-of-concept on the existence of a mapping of the set<br> 
of all computations into a subset of harmonic analysis. This requires recognizing three principles:<br>
It also represents an effort to counterfeit this unnoying habit of requiring "axiomatically" the existence of a "binary"<br>
medium in order to build a computational medium. Instead, we can do it with waves but with no ordinary encodings<br>

A. The existence of constant maximal entropic encodings in a Fourier domain signifies a deviation from ordinary Shannon<br> channels where capacity is no more tied up solely to the S/N ratio (SNR becomes here a freely adjustable parameter given by the<br>
unique spectra lcoefficient apart from the exact message encoded). The essence of this can be understood with analogical<br>
thinking by stating that the bits are to the integers as the frequencies are to a time domain signal and by the same token,<br> 
as eigenstates are to a cavity or an abstract system on a Hilbert space.

B. <it><b>Pluribus Unum Principle:</it></b>The application of spectral methods via a transcription of the "Wheels" technique directly into the<br> 
spectrum of a unique signal allows to make any such model parallel computation into an analog model corresponding to a<br> particular dynamical system acting on a single signal.<br>

C. If an equitempered harmonic scale is to be used for tuning such a machine then a single signal and its transformations <br>
over time could be made audible in an appropriate bandwidth up to say, 20-30 kHz running aross all octaves. Coexistence<br>
(superposition) of a multiplicity of states from an alphabet in one and the same signal (<it>"Pluribus Unum"</it> Principle) allows<br> 
in the case of a harmonic encoding a direct mapping into the recently found theory of
<a href="https://en.wikipedia.org/wiki/Orbifold#Music_theory">Musical Orbifolds</a>. Hence in a sense<br>
orbifolds can also be considered as equivalent models for analog universal computation in a poly-harmonic encoding.

Construction of such a machine or its emulator can take advantage of both 
<a href="https://en.wikipedia.org/wiki/Additive_synthesis">Additive</a> as well as 
<a href="https://en.wikipedia.org/wiki/Additive_synthesis#Inverse_FFT_synthesis">IFFT</a> Synthesis techniques<br>
One can take advantage of the fact that a circulant operator when acting on teh frequency domain admits a much simpler<br> representation in the time domain as a multiplication with only a vector of eigenvalues. The effort is to avoid as much as<br>
possible the use of fft and its inverses. One can then use a basic encoding of a Fourier series starting from a fundamental<br> with an appropriate inter-frequency span and then find a udnique class of dynamical systems able to mimic the behavior of the "digital" code "Wheels1D.m"<br>

All technical details given here are not by any means restricted to the audible spectrum which is solely used as a means of<br>
of demonstration. As a matter of fact, any abstract system having a Hilbert Space could be used given the existence of some<br> 
method of selectively picking up any subset of such states at each iteration step. In order to complete a fully programmable<br>
 analog computer one must also consult the basis of computing automata to filter out those cases that are more amenable<br>
to a direct transcription. One should recall that there are equivalent 
<a href="https://en.wikipedia.org/wiki/Turing_completeness">Turing complete</a> systems known as <br>
<a href="https://en.wikipedia.org/wiki/Semi-Thue_system">String Rewriting Automata</a>. There are also classes of programming
languages that are equivalent to non-Von Neumann<br> 
architectures as for instance the <a href="https://en.wikipedia.org/wiki/Lisp_machine">LISP machine</a>.
Even <a href="https://en.wikipedia.org/wiki/Multi-agent_system">Multi-Agent Systems</a> or Reaction-Diffusion Systems
have been proven<br> 
to be Turing complete with certain implications for biological systems as well. Hence, the repertoire one now has to choose<br>
from is sufficient to consider the advance of programmable analog machines as plausible.<br>

Performing a musical encoding requires a slight alteration in the inter-frequency spacing. One just starts from the lowest<br>
octave considering a superposition like a sequence of notes ABCDEFGABCDEFG... acorss increasing frequency octaves<br> 
played all together like a chord. All spectral coefficients are taken equal and cosntant. Then one separates even and odd<br> positions where presence of an odd note representes the presence of a bit and presence of an even one the absence of a bit.<br>
A binary word like "100110" can then be encoded as "ADFGBE". Only disadvantage in this case is the low capacity of the<br>
resulting musical register in the audible spectrum. A similar variant could be given with the aid of the ancient 
<a href="https://en.wikipedia.org/wiki/Pythagorean_tuning">Pythagorian</a> scale.

The above guranatees isospectral computation. If you also want to guarantee the isentropic character in the ordinary sense<br>
used by information engineers one can also separate odd and even spectral coefficients so as to have the later been half <br>
 of the first or the reverse and spread around half of the interfrequency intervals with some Gaussian fit. Then any histogram<br> used to compute standard Shannon's entropy would be balanced around log(2) just as in the original "digital" version<br> of the 'spectral1D' code.
 
 It should be noted that there is a much more compact method of isospectral encoding for a powerset of 2^N bit-strings<br>
 Given a bit-block counter, each and every word is analyzed into its constituent alternating bolcks of zeros and ones.<br>
 For instance, "11010100" -> [2, -1, 1, -1, 1, -2]. As this is always an alternating sequence it can be turned into its<br>
 "monic" form by extracting a sign bit in front as 0/1. Normalizing the above with the sum-of-squares and taking them as<br>
 spectral coefficients allows writing  lesser frequencies in a harmonic interval at the same time guaranteeing the isospectral<br> character of the encoding. This method though is difficult to emulate for the rule application and is not
 followed here.

Building a particular (continuous) dynamical system able to apply the particular "program" given as the harmonic encoding<br>
of the original CA rule is a different engineering problem and could be dealt in a variety of ways using eg. vector coding <br>
and generic Neural Network techniques. For building an emulator is enough to take all appropriate frequency shifts via a single<br> loop although this is neither optimal nor the speediest implementation possible. It suffices though to give the<br>
listener a feeling of how does a Turing complete rule like 
<a href="https://en.wikipedia.org/wiki/Rule_110">"110"</a> sounds like. It also means that for small cell arrays fitting<br> into an audible spectrum via an equitempered harmonic tuning, one could really use an orchestra/choir to actually perform<br>
a computation!
