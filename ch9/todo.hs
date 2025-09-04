module Todo where

-- todo check that index is not out of bounds
-- todo check that the index is a number

import System.Environment
import System.Directory
import System.IO
import Data.List
import Control.Exception

dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "remove" = remove
dispatch "view" = view
dispatch "bump" = bump
dispatch command = doesntExist command

main = do
    fullArgList <- getArgs
    if null fullArgList
        then putStrLn "Command expected"
        else do
            let (command:argList) = fullArgList
            dispatch command argList

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")
add _ = putStrLn "This command takes exactly 2 arguments"

view :: [String] -> IO ()
view [fileName] = do
    fileExists <- doesFileExist fileName
    if not fileExists
        then putStrLn $ "File " ++ fileName ++ " doesn't exist"
        else do
            contents <- readFile fileName
            let todoTasks = lines contents
                numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
                    [0..] todoTasks
            putStr $ unlines numberedTasks
view _ = putStrLn "This command takes exactly 1 argument"

remove :: [String] -> IO ()
remove [fileName, numberString] = do
    fileExists <- doesFileExist fileName
    if not fileExists
        then putStrLn $ "File " ++ fileName ++ " doesn't exist"
        else do
            contents <- readFile fileName
            let todoTasks = lines contents
                numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
                    [0..] todoTasks
            putStrLn "These are your TO-DO items:"
            mapM_ putStrLn numberedTasks
            let number = read numberString
                newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
            bracketOnError (openTempFile "." "temp")
                (\(tempFile, tempHandle) -> do
                    hClose tempHandle
                    removeFile tempFile)
                (\(tempFile, tempHandle) -> do
                    hPutStr tempHandle newTodoItems
                    hClose tempHandle
                    removeFile fileName
                    renameFile tempFile fileName)
remove _ = putStrLn "This command takes exactly 2 arguments"

bump :: [String] -> IO ()
bump [fileName, numberString] = do
    fileExists <- doesFileExist fileName
    if not fileExists
        then putStrLn $ "File " ++ fileName ++ " doesn't exist"
        else do
            contents <- readFile fileName
            let todoTasks = lines contents
                numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
                    [0..] todoTasks
            putStrLn "These are your TO-DO items:"
            mapM_ putStrLn numberedTasks
            let number = read numberString
                line = todoTasks !! number
                newTodoItems = unlines $ [line] ++ (delete (todoTasks !! number) todoTasks)
            bracketOnError (openTempFile "." "temp")
                (\(tempFile, tempHandle) -> do
                    hClose tempHandle
                    removeFile tempFile)
                (\(tempFile, tempHandle) -> do
                    hPutStr tempHandle newTodoItems
                    hClose tempHandle
                    removeFile fileName
                    renameFile tempFile fileName)
bump _ = putStrLn "This command takes exactly 2 arguments"

doesntExist :: String -> [String] -> IO ()
doesntExist command _ =
    putStrLn $ "Command " ++ command ++ " doesn't exist"
