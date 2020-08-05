Follow Up Questions:

What libraries did you use? Why did you use them?
```
For the user stories I didn't use anything extra dependencies, just overriding
the `destroy` method from Applicant to use the soft-delete pattern with
an extra column. Unless there's a clear need to use a dependency I can integrate
it, otherwise I'll implement a minimum version of what's needed and improve it if
it's needed. 
```

If you had more time, what further improvements or new features would you add?
```
I would implement a more robust version of ViewModels with a Form wrapper
to avoid having to leak the ActiveRecord model, also implement in ServiceObjects
an error catching to handle exceptions and return Success/Failure objects to
reply in the responses.
I'd have another controller for Reports and a separated controller for Exports.
I'll probably not use soft-delete and instead archiving it to a different table, to avoid making the table grow with them, it would help with performance in the long term.
Perhaps implementing a unique email index.
I would add transaction logger or audit logger for Applicant as well. 

```

Which parts are you most proud of? And why?
```
ViewModels and ServiceObjects, plus clean and lean Models and Controllers. Unit tests for stuff that communicates to the team what adds value.
```

Which parts did you spend the most time with? What did you find most difficult?
```
Extract smaller versions of ViewModels and ServiceObjects I used in previous
projects. I also haven't worked in controller tests in a while so I just followed
the pattern created by the scaffold tool from Rails (previous company had QA team that will test manually and automatically with scripts).
```
