return {
	settings = {

		python = {
			analysis = {
				useLibraryCodeForTypes = false, -- This sounds useful.

				-- This should be overridden by my settings below
				-- typeCheckingMode = "basic",

				strictListInference = false,
				strictDictionaryInference = false,
				strictSetInference = false,
				strictParameterNoneValue = false,
				enableTypeIgnoreComments = true,
				reportPropertyTypeMismatch = "error",
				reportFunctionMemberAccess = "none", -- ??
				reportUnusedImport = "information",
				reportUnusedClass = "information",
				reportUnusedFunction = "information",
				reportUnusedVariable = "information",
				reportDuplicateImport = "information",
				reportUntypedFunctionDecorator = "information",
				reportUntypedClassDecorator = "information",
				reportPrivateUsage = "error",
				reportConstantRedefinition = "error",
				reportUninitializedInstanceVariable = "error",
				reportUnknownParameterType = "none",
				reportUnknownoArgumentType = "none",
				reportUnknownLambdaType = "none",
				reportUnknownVariableType = "none",
				reportUnknownMemberType = "none",
				reportMissingParameterType = "none",
				reportMissingTypeArgument = "none",
				reportCallInDefaultInitializer = "warning",
				reportUnnecessaryIsInstance = "warning",
				reportUnnecessaryCast = "warning",
				reportUnnecessaryComparison = "warning",
				reportUnusedCallResult = "warning",
				reportUnnecessaryTypeIgnoreComment = "warning",
				reportMatchNotExhaustive = "warning",
			},
		},
	},
}
